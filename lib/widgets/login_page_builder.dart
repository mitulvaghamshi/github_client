import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_client/utils/client_config.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart' as ul;
import 'package:window_to_front/window_to_front.dart';

typedef AuthBuilder =
    Widget Function(
      BuildContext context,
      AsyncCallback onLogout,
      RequestHandler handler,
    );

@immutable
class LoginPageBuilder extends StatefulWidget {
  const LoginPageBuilder({
    super.key,
    required this.config,
    required this.builder,
  });

  final ClientConfig config;
  final AuthBuilder builder;

  @override
  State<LoginPageBuilder> createState() => _LoginPageBuilderState();
}

class _LoginPageBuilderState extends State<LoginPageBuilder> {
  HttpServer? _redirectServer;
  oauth2.Client? _client;

  Future<void> _login() async {
    final client = await _authRequest();
    await WindowToFront.activate();
    if (mounted) setState(() => _client = client);
  }

  Future<void> logout() async {
    await ul.launchUrl(.https('github.com', 'logout'));
    await WindowToFront.activate();
    if (mounted) setState(() => _client = null);
  }

  @override
  Widget build(BuildContext context) {
    final client = _client;
    if (client != null) {
      final handler = RequestHandler(
        limit: widget.config.limit,
        link: HttpLink(widget.config.graphqlUrl, httpClient: client),
      );
      return widget.builder(context, logout, handler);
    }
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Hello, Guest')),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: _login,
          child: const Text('Authenticate with GitHub'),
        ),
      ),
    );
  }
}

extension on _LoginPageBuilderState {
  Future<oauth2.Client> _authRequest() async {
    await _redirectServer?.close();
    // Bind to an ephemeral port on localhost
    _redirectServer = await .bind('localhost', 0);
    final redirectUrl = Uri.http('localhost:${_redirectServer!.port}');
    return _getClient(redirectUrl);
  }

  Future<oauth2.Client> _getClient(Uri redirectUrl) async {
    final grant = oauth2.AuthorizationCodeGrant(
      widget.config.clientId,
      widget.config.authEndpoint,
      widget.config.tokenEndpoint,
      secret: widget.config.clientSecret,
      httpClient: _JsonHttpClient(),
    );
    await ul.launchUrl(
      grant.getAuthorizationUrl(redirectUrl, scopes: widget.config.scopes),
    );
    return grant.handleAuthorizationResponse(await _listen());
  }

  Future<Map<String, String>> _listen() async {
    var request = await _redirectServer!.first
      ..response.statusCode = 200
      ..response.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.text.mimeType,
      )
      ..response.writeln('Authenticated! You can close this window.');
    await request.response.close();
    await _redirectServer!.close();
    _redirectServer = null;
    return request.uri.queryParameters;
  }
}

@immutable
class _JsonHttpClient extends http.BaseClient {
  _JsonHttpClient() : _client = http.Client();

  final http.Client _client;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers[HttpHeaders.acceptHeader] = ContentType.json.mimeType;
    return _client.send(request);
  }
}
