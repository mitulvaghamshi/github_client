import 'package:flutter/foundation.dart';

const _keyClientID = 'CLIENT_ID';
const _keyClientSecret = 'CLIENT_SECRET';

@immutable
class ClientConfig {
  ClientConfig({
    required this.limit,
    required this.scopes,
    required this.clientId,
    required this.clientSecret,
  }) : assert(limit > 0, 'Limit must be greater then zero.'),
       assert(scopes.isNotEmpty, 'Scopes cannot be empty.'),
       assert(clientId.isNotEmpty, '$_keyClientID cannot be empty.'),
       assert(clientSecret.isNotEmpty, '$_keyClientSecret cannot be empty.');

  factory ClientConfig.fromEnv() => ClientConfig(
    limit: 100,
    scopes: const ['repo', 'read:org'],
    clientId: const .fromEnvironment(_keyClientID),
    clientSecret: const .fromEnvironment(_keyClientSecret),
  );

  final int limit;
  final List<String> scopes;
  final String clientId;
  final String clientSecret;
}

extension Utils on ClientConfig {
  String get graphqlUrl => Uri.https('api.github.com', 'graphql').toString();
  Uri get tokenEndpoint => .https('github.com', 'login/oauth/access_token');
  Uri get authEndpoint => .https('github.com', 'login/oauth/authorize');
}
