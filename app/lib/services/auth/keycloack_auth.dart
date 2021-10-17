import 'dart:convert';

import 'package:app/services/auth/appOpenId.dart';
import 'package:app/services/auth/auth_protocol.dart';
import 'package:openid_client/openid_client_io.dart' as oidc;
import 'package:url_launcher/url_launcher.dart';
import '../api.dart';
import 'package:shared_preferences/shared_preferences.dart';

final api = new Api();

class KeycloakAuth extends AuthProtocol {
  @override
  Future<bool> auth(Uri uri, String clientId, List<String> scopes, int port,
      String secret, Uri redirectUri) async {
    // create the client
    var issuer = await oidc.Issuer.discover(uri);
    var client = new oidc.Client(issuer, clientId, clientSecret: secret);

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = new BrbOpenId(
        client, port, urlLauncher, scopes, Uri.parse("http://localhost:4200/"));

    try {
      // starts the authentication
      var openIdCodeResponse = await authenticator.authorizeBrb();

      final brbAuth =
          await api.post(route: '/auth/token', body: openIdCodeResponse);
      final brbAuthJson = jsonDecode(brbAuth.body);

      final localStorage = await SharedPreferences.getInstance();
      await localStorage.setString('token', brbAuthJson['token']);
      await localStorage.setString('person', jsonEncode(brbAuthJson['person']));
      await localStorage.setString(
          'account', jsonEncode(brbAuthJson['account']));

      // close the webview when finished
      closeWebView();

      // return the user info

      return true;
    } catch (error) {
      return false;
    }
  }
}
