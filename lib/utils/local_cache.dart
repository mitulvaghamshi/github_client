import 'package:flutter/foundation.dart' show immutable;
import 'package:github_client/utils/utils.dart';

@immutable
class LocalCache {
  const LocalCache({
    required this.user,
    required this.repos,
    required this.prs,
    required this.issues,
  });

  const LocalCache.empty()
    : user = null,
      repos = null,
      prs = null,
      issues = null;

  final Viewer? user;
  final Iterable<Repo>? repos;
  final Iterable<PullReq>? prs;
  final Iterable<Issue>? issues;

  LocalCache copyWith({
    Viewer? user,
    Iterable<Repo>? repos,
    Iterable<PullReq>? prs,
    Iterable<Issue>? issues,
  }) => .new(
    user: user ?? this.user,
    repos: repos ?? this.repos,
    prs: prs ?? this.prs,
    issues: issues ?? this.issues,
  );
}
