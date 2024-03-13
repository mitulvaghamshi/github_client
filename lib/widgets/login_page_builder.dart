import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:github_client/utils/client_config.dart';
import 'package:github_client/utils/request_handler.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart' as ul;

typedef AuthenticatedBuilder = Widget Function(
    BuildContext context, RequestHandler handler);

@immutable
class LoginPageBuilder extends StatefulWidget {
  const LoginPageBuilder({
    super.key,
    required this.config,
    required this.builder,
  });

  final ClientConfig config;
  final AuthenticatedBuilder builder;

  @override
  LoginPageBuilderState createState() => LoginPageBuilderState();
}

class LoginPageBuilderState extends State<LoginPageBuilder> {
  HttpServer? _redirectServer;
  oauth2.Client? _client;

  @override
  Widget build(BuildContext context) {
    final client = _client;
    if (client != null) {
      final requestHandler = RequestHandler(
        limit: widget.config.limit,
        link: widget.config.getHttpLink(client),
      );
      return widget.builder(context, requestHandler);
    }
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Welcome, Guest'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () async => _onAuthRequest((authorizedClient) {
            if (context.mounted) setState(() => _client = authorizedClient);
          }),
          color: CupertinoColors.activeGreen,
          child: const Text('Authenticate with GitHub'),
        ),
      ),
    );
  }
}

extension on LoginPageBuilderState {
  Future<void> _onAuthRequest(ValueChanged<oauth2.Client> onAuthorize) async {
    await _redirectServer?.close();
    // Bind to an ephemeral port on localhost
    _redirectServer = await HttpServer.bind('localhost', 0);
    final redirectUrl = Uri.http('localhost:${_redirectServer!.port}', '');
    final client = await _getOAuth2Client(redirectUrl);
    onAuthorize(client);
  }

  Future<oauth2.Client> _getOAuth2Client(Uri redirectUrl) async {
    if (widget.config.isEmpty) {
      throw const _ConfigException('Invalid github config...!');
    }
    final grant = oauth2.AuthorizationCodeGrant(
      widget.config.clientId,
      widget.config.authorizationEndpoint,
      widget.config.tokenEndpoint,
      secret: widget.config.clientSecret,
      httpClient: _JsonHttpClient(),
    );
    final authorizationUrl = grant.getAuthorizationUrl(
      redirectUrl,
      scopes: widget.config.scopes,
    );
    await _redirect(authorizationUrl);
    final queryParam = await _listen();
    return grant.handleAuthorizationResponse(queryParam);
  }

  Future<void> _redirect(Uri uri) async {
    if (await ul.canLaunchUrl(uri)) {
      await ul.launchUrl(uri);
    } else {
      throw _ConfigException('Cannot launch $uri');
    }
  }

  Future<Map<String, String>> _listen() async {
    final request = await _redirectServer!.first;
    request.response.statusCode = 200;
    request.response.headers.set('Content-Type', 'text/plain');
    request.response.writeln('Authenticated! You can close the window.');
    await request.response.close();
    await _redirectServer!.close();
    _redirectServer = null;
    return request.uri.queryParameters;
  }
}

@immutable
class _JsonHttpClient extends http.BaseClient {
  late final http.Client _httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return _httpClient.send(request);
  }
}

@immutable
class _ConfigException implements Exception {
  const _ConfigException(this.message);

  final String message;

  @override
  String toString() => '''[GITHUB_CLIENT]
Cause: $message

Usage:
    flutter run --dart-define-from-file=<path-to-config.json>

See README.md for more info.
''';
}
