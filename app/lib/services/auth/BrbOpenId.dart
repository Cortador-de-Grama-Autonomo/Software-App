import 'dart:async';
import 'dart:io';

import 'package:openid_client/openid_client_io.dart';

class BrbOpenId extends Authenticator {
  BrbOpenId(
      Client client, port, urlLancher, Iterable<String> scopes, redirectUri)
      : super(client,
            scopes: scopes,
            port: port,
            urlLancher: urlLancher,
            redirectUri: redirectUri);

  Future authorizeBrb() async {
    var state = flow.authenticationUri.queryParameters['state'];
    _requestsByState[state] = Completer();
    await _startServer(port);
    urlLancher(flow.authenticationUri.toString());
    var response = await _requestsByState[state].future;
    return response;
  }

  static final Map<int, Future<HttpServer>> _requestServers = {};
  static final Map<String, Completer<Map<String, String>>> _requestsByState =
      {};

  static Future<HttpServer> _startServer(int port) {
    return _requestServers[port] ??=
        (HttpServer.bind(InternetAddress.loopbackIPv4, port)
          ..then((requestServer) async {
            await for (var request in requestServer) {
              request.response.statusCode = 200;
              request.response.headers.set('Content-type', 'text/html');
              request.response.writeln('<html>'
                  '<h1>You can now close this window</h1>'
                  '<script>window.close();</script>'
                  '</html>');
              await request.response.close();
              var result = request.requestedUri.queryParameters;

              if (!result.containsKey('state')) continue;
              var r = _requestsByState.remove(result['state']);
              r.complete(result);
              if (_requestsByState.isEmpty) {
                for (var s in _requestServers.values) {
                  await (await s).close();
                }
                _requestServers.clear();
              }
            }

            await _requestServers.remove(port);
          }));
  }
}
