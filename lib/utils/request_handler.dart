import 'dart:async' show Future;

import 'package:github_client/src/github_gql/github_gql.dart';
import 'package:github_client/utils/local_cache.dart';
import 'package:github_client/utils/utils.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';

class RequestHandler {
  RequestHandler({required this.limit, required this.link})
    : _cache = const .empty();

  final int limit;
  final HttpLink link;

  LocalCache _cache;
}

extension Utils on RequestHandler {
  Future<Viewer> getViewer() async {
    if (_cache.user != null) return _cache.user!;
    final req = GViewerDetail((builder) => builder);
    final res = await _handle(req.operation, req.vars.toJson());
    final viewer = GViewerDetailData.fromJson(res.data!)!.viewer;
    _cache = _cache.copyWith(user: viewer);
    return viewer;
  }

  Future<Iterable<Repo>> repositories() async {
    if (_cache.repos != null) return _cache.repos!;
    final req = GRepositories((builder) => builder..vars.count = limit);
    final res = await _handle(req.operation, req.vars.toJson());
    final repos = GRepositoriesData.fromJson(
      res.data!,
    )!.viewer.repositories.nodes!.whereType<Repo>();
    _cache = _cache.copyWith(repos: repos);
    return repos;
  }

  Future<Iterable<PullReq>> pullRequests() async {
    if (_cache.prs != null) return _cache.prs!;
    final req = GPullRequests((builder) => builder..vars.count = limit);
    final res = await _handle(req.operation, req.vars.toJson());
    final items = GPullRequestsData.fromJson(res.data!)!
        .viewer
        .pullRequests
        .edges!
        .map((edge) => edge!.node)
        .whereType<PullReq>();
    _cache = _cache.copyWith(prs: items);
    return items;
  }

  Future<Iterable<Issue>> assignedIssues() async {
    if (_cache.issues != null) return _cache.issues!;
    final viewer = await getViewer();
    final req = GAssignedIssues((builder) {
      builder
        ..vars.count = limit
        ..vars.query = 'is:open assignee:${viewer.login} archived:false';
    });
    final res = await _handle(req.operation, req.vars.toJson());
    final issues = GAssignedIssuesData.fromJson(
      res.data!,
    )!.search.edges!.map((edge) => edge!.node).whereType<Issue>();
    _cache = _cache.copyWith(issues: issues);
    return issues;
  }
}

extension on RequestHandler {
  Future<Response> _handle(Operation op, Map<String, dynamic> vars) async {
    final req = Request(operation: op, variables: vars);
    final res = await link.request(req).first;
    if (res.errors case List<GraphQLError> errors when errors.isNotEmpty) {
      throw GraphQLError(message: errors.join(','));
    }
    return res;
  }
}
