import 'package:flutter/foundation.dart' show immutable;
import 'package:github_client/utils/request_handler.dart';

@immutable
class CacheBox {
  const CacheBox({
    required this.viewer,
    required this.repositories,
    required this.pullRequests,
    required this.assignedIssues,
  });

  const CacheBox.empty()
    : viewer = null,
      repositories = null,
      pullRequests = null,
      assignedIssues = null;

  final Viewer? viewer;
  final Iterable<Repo>? repositories;
  final Iterable<PullReq>? pullRequests;
  final Iterable<Issue>? assignedIssues;
}

extension Utils on CacheBox {
  CacheBox copyWith({
    Viewer? viewer,
    Iterable<Repo>? repositories,
    Iterable<PullReq>? pullRequests,
    Iterable<Issue>? assignedIssues,
  }) => CacheBox(
    viewer: viewer ?? this.viewer,
    repositories: repositories ?? repositories,
    pullRequests: pullRequests ?? this.pullRequests,
    assignedIssues: assignedIssues ?? this.assignedIssues,
  );
}
