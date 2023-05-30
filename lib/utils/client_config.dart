import 'package:flutter/cupertino.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

@immutable
final class ClientConfig {
  ClientConfig({
    required this.limit,
    required this.scopes,
    required this.clientId,
    required this.clientSecret,
  })  : assert(limit > 0, 'Limit must be greater then zero.'),
        authorizationEndpoint =
            Uri.https('github.com', 'login/oauth/authorize'),
        tokenEndpoint = Uri.https('github.com', 'login/oauth/access_token');

  final int limit;
  final List<String> scopes;
  final String clientId;
  final String clientSecret;
  final Uri authorizationEndpoint;
  final Uri tokenEndpoint;

  bool get isEmpty => clientId.isEmpty || clientSecret.isEmpty;

  HttpLink getHttpLink(oauth2.Client client) =>
      HttpLink('https://api.github.com/graphql', httpClient: client);
}
