import 'package:gql_http_link/gql_http_link.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class GitHubConfig {
  GitHubConfig({
    required this.clientId,
    required this.clientSecret,
    required this.scopes,
  })  : authorizationEndpoint =
            Uri.https('github.com', 'login/oauth/authorize'),
        tokenEndpoint = Uri.https('github.com', 'login/oauth/access_token');

  final String clientId;
  final String clientSecret;
  final List<String> scopes;
  final Uri authorizationEndpoint;
  final Uri tokenEndpoint;

  bool get isEmpty => clientId.isEmpty || clientSecret.isEmpty;

  HttpLink getHttpLink(oauth2.Client client) {
    return HttpLink('https://api.github.com/graphql', httpClient: client);
  }
}
