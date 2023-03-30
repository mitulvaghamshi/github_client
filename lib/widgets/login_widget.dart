import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:github_app/utils/github_config.dart';
import 'package:github_app/utils/invalid_config_exception.dart';
import 'package:github_app/utils/json_accepting_http_client.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart' as ul;

typedef AuthenticatedBuilder = Widget Function(
    BuildContext context, HttpLink link);

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    required this.config,
    required this.builder,
  });

  final GitHubConfig config;
  final AuthenticatedBuilder builder;

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  HttpServer? _redirectServer;
  oauth2.Client? _client;

  @override
  Widget build(BuildContext context) {
    var client = _client;
    if (client != null) {
      return widget.builder(context, widget.config.getHttpLink(client));
    }
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Welcome, Guest'),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeGreen,
          onPressed: () async => _onAuthRequest((authorizedClient) {
            if (context.mounted) setState(() => _client = authorizedClient);
          }),
          child: const Text('Authenticate with GitHub'),
        ),
      ),
    );
  }
}

extension on LoginWidgetState {
  Future<void> _onAuthRequest(ValueChanged<oauth2.Client> onSuccess) async {
    await _redirectServer?.close();
    // Bind to an ephemeral port on localhost
    _redirectServer = await HttpServer.bind('localhost', 0);
    onSuccess(await _getOAuth2Client(
        Uri.http('localhost:${_redirectServer!.port}', '')));
  }

  Future<oauth2.Client> _getOAuth2Client(Uri redirectUrl) async {
    if (widget.config.isEmpty) {
      throw const InvalidConfigException('Invalid github config...!');
    }
    var grant = oauth2.AuthorizationCodeGrant(
      widget.config.clientId,
      widget.config.authorizationEndpoint,
      widget.config.tokenEndpoint,
      secret: widget.config.clientSecret,
      httpClient: JsonAcceptingHttpClient(),
    );
    await _redirect(grant.getAuthorizationUrl(
      redirectUrl,
      scopes: widget.config.scopes,
    ));
    var resQueryParam = await _listen();
    return await grant.handleAuthorizationResponse(resQueryParam);
  }

  Future<void> _redirect(Uri authorizationUrl) async {
    if (await ul.canLaunchUrl(authorizationUrl)) {
      await ul.launchUrl(authorizationUrl);
    } else {
      throw InvalidConfigException('Cannot launch $authorizationUrl');
    }
  }

  Future<Map<String, String>> _listen() async {
    var request = await _redirectServer!.first;
    request.response.statusCode = 200;
    request.response.headers.set('Content-Type', 'text/plain');
    request.response.writeln('Authenticated! You can close the window.');
    await request.response.close();
    await _redirectServer!.close();
    _redirectServer = null;
    return request.uri.queryParameters;
  }
}
