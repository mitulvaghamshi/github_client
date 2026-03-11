import 'package:flutter/foundation.dart' show immutable;
import 'package:github_client/utils/utils.dart';

@immutable
class const LocalCache({
  final Viewer? user,
  final Iterable<Repo>? repos,
  final Iterable<PullReq>? prs,
  final Iterable<Issue>? issues,
}) {
  factory empty() => const .new();

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
