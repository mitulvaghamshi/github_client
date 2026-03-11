import 'package:flutter/foundation.dart';

const _keyClientID = 'CLIENT_ID';
const _keyClientSecret = 'CLIENT_SECRET';

@immutable
class ClientConfig({
  required final int limit,
  required final List<String> scopes,
  required final String clientId,
  required final String clientSecret,
}) {
  this
    : assert(limit > 0, 'Limit must be greater then zero.'),
      assert(scopes.isNotEmpty, 'Scopes cannot be empty.'),
      assert(clientId.isNotEmpty, '$_keyClientID cannot be empty.'),
      assert(clientSecret.isNotEmpty, '$_keyClientSecret cannot be empty.');

  factory fromEnv() => ClientConfig(
    limit: 100,
    scopes: const ['repo', 'read:org'],
    clientId: const .fromEnvironment(_keyClientID),
    clientSecret: const .fromEnvironment(_keyClientSecret),
  );
}

extension Utils on ClientConfig {
  String get graphqlUrl => Uri.https('api.github.com', 'graphql').toString();
  Uri get tokenEndpoint => .https('github.com', 'login/oauth/access_token');
  Uri get authEndpoint => .https('github.com', 'login/oauth/authorize');
}
