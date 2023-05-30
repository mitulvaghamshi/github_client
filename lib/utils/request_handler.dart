import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:github_client/src/github_gql/github_gql.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';

typedef Viewer = GViewerDetailData_viewer;
typedef Repo = GRepositoriesData_viewer_repositories_nodes;
typedef Issue = GAssignedIssuesData_search_edges_node__asIssue;
typedef PullReq = GPullRequestsData_viewer_pullRequests_edges_node;

final class RequestHandler {
  RequestHandler({required this.limit, required this.link})
      : _cache = _CacheBox.empty();

  final int limit;
  final HttpLink link;
  _CacheBox _cache;

  Future<Response> handle(operation, variables) async {
    final request = Request(operation: operation, variables: variables);
    final response = await link.request(request).first;
    final errors = response.errors;
    if (errors != null && errors.isNotEmpty) throw _QueryException(errors);
    return response;
  }

  Future<Viewer> getViewer() async {
    if (_cache.viewer != null) return _cache.viewer!;
    final request = GViewerDetail((builder) => builder);
    final response = await handle(request.operation, request.vars.toJson());
    _cache = _cache.copyWith(
        viewer: GViewerDetailData.fromJson(response.data!)!.viewer);
    return _cache.viewer!;
  }

  Future<Iterable<Repo>> repositories() async {
    if (_cache.repositories != null) return _cache.repositories!;
    final requaest = GRepositories((builder) => builder..vars.count = limit);
    final response = await handle(requaest.operation, requaest.vars.toJson());
    _cache = _cache.copyWith(
        repositories: GRepositoriesData.fromJson(response.data!)!
            .viewer
            .repositories
            .nodes!
            .whereType<Repo>());
    return _cache.repositories!;
  }

  Future<Iterable<PullReq>> pullRequests() async {
    if (_cache.pullRequests != null) return _cache.pullRequests!;
    final request = GPullRequests((builder) => builder..vars.count = limit);
    final response = await handle(request.operation, request.vars.toJson());
    _cache = _cache.copyWith(
        pullRequests: GPullRequestsData.fromJson(response.data!)!
            .viewer
            .pullRequests
            .edges!
            .map((edge) => edge!.node)
            .whereType<PullReq>());
    return _cache.pullRequests!;
  }

  Future<Iterable<Issue>> assignedIssues() async {
    if (_cache.assignedIssues != null) return _cache.assignedIssues!;
    final viewer = await getViewer();
    final request = GAssignedIssues((builder) => builder
      ..vars.count = limit
      ..vars.query = 'is:open assignee:${viewer.login} archived:false');
    final response = await handle(request.operation, request.vars.toJson());
    _cache = _cache.copyWith(
        assignedIssues: GAssignedIssuesData.fromJson(response.data!)!
            .search
            .edges!
            .map((edge) => edge!.node)
            .whereType<Issue>());
    return _cache.assignedIssues!;
  }
}

@immutable
final class _CacheBox {
  const _CacheBox({
    required this.viewer,
    required this.repositories,
    required this.pullRequests,
    required this.assignedIssues,
  });

  factory _CacheBox.empty() => const _CacheBox(
      viewer: null,
      repositories: null,
      pullRequests: null,
      assignedIssues: null);

  final Viewer? viewer;
  final Iterable<Repo>? repositories;
  final Iterable<PullReq>? pullRequests;
  final Iterable<Issue>? assignedIssues;

  _CacheBox copyWith({
    Viewer? viewer,
    Iterable<Repo>? repositories,
    Iterable<PullReq>? pullRequests,
    Iterable<Issue>? assignedIssues,
  }) =>
      _CacheBox(
        viewer: viewer ?? this.viewer,
        repositories: repositories ?? this.repositories,
        pullRequests: pullRequests ?? this.pullRequests,
        assignedIssues: assignedIssues ?? this.assignedIssues,
      );
}

@immutable
final class _QueryException implements Exception {
  const _QueryException(this.errors);

  final List<GraphQLError> errors;

  @override
  String toString() =>
      'Query Exception: ${errors.map((error) => '$error').join(',')}';
}
