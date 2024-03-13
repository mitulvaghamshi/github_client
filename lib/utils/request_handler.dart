import 'dart:async' show Future;

import 'package:github_client/src/github_gql/github_gql.dart';
import 'package:github_client/utils/cache_box.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';

typedef Viewer = GViewerDetailData_viewer;
typedef Repo = GRepositoriesData_viewer_repositories_nodes;
typedef Issue = GAssignedIssuesData_search_edges_node__asIssue;
typedef PullReq = GPullRequestsData_viewer_pullRequests_edges_node;

class RequestHandler {
  RequestHandler({required this.limit, required this.link})
    : _cache = const .empty();

  final int limit;
  final HttpLink link;

  CacheBox _cache;
}

extension Utils on RequestHandler {
  Future<Viewer> getViewer() async {
    if (_cache.viewer != null) return _cache.viewer!;
    final req = GViewerDetail((builder) => builder);
    final res = await _handle(req.operation, req.vars.toJson());
    final viewer = GViewerDetailData.fromJson(res.data!)!.viewer;
    _cache = _cache.copyWith(viewer: viewer);
    return viewer;
  }

  Future<Iterable<Repo>> repositories() async {
    if (_cache.repositories != null) return _cache.repositories!;
    final req = GRepositories((builder) => builder..vars.count = limit);
    final res = await _handle(req.operation, req.vars.toJson());
    final items = GRepositoriesData.fromJson(
      res.data!,
    )!.viewer.repositories.nodes!.whereType<Repo>();
    _cache = _cache.copyWith(repositories: items);
    return items;
  }

  Future<Iterable<PullReq>> pullRequests() async {
    if (_cache.pullRequests != null) return _cache.pullRequests!;
    final req = GPullRequests((builder) => builder..vars.count = limit);
    final res = await _handle(req.operation, req.vars.toJson());
    final items = GPullRequestsData.fromJson(res.data!)!
        .viewer
        .pullRequests
        .edges!
        .map((edge) => edge!.node)
        .whereType<PullReq>();
    _cache = _cache.copyWith(pullRequests: items);
    return items;
  }

  Future<Iterable<Issue>> assignedIssues() async {
    if (_cache.assignedIssues != null) return _cache.assignedIssues!;
    final viewer = await getViewer();
    final req = GAssignedIssues((builder) {
      builder
        ..vars.count = limit
        ..vars.query = 'is:open assignee:${viewer.login} archived:false';
    });
    final res = await _handle(req.operation, req.vars.toJson());
    final items = GAssignedIssuesData.fromJson(
      res.data!,
    )!.search.edges!.map((edge) => edge!.node).whereType<Issue>();
    _cache = _cache.copyWith(assignedIssues: items);
    return items;
  }
}

extension on RequestHandler {
  Future<Response> _handle(Operation ops, Map<String, dynamic> vars) async {
    final req = Request(operation: ops, variables: vars);
    final res = await link.request(req).first;
    final err = res.errors;
    if (err != null) throw GraphQLError(message: err.join(','));
    return res;
  }
}
