import 'package:app/services/auth/auth_protocol.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Auth {
  String _secret = "brb-lift";
  int _port = 4200;
  Uri _uri =
      Uri.parse("http://${DotEnv().env['IP_ADDRESS']}:8080/auth/realms/brb");
  String _clientId = 'backend';
  List<String> _scopes = ['openid', 'profile'];
  Uri _redirectUri =
      Uri.parse("http://${DotEnv().env['IP_ADDRESS']}:8000/api/auth/token/");
  AuthProtocol authProtocol;

  Auth({@required this.authProtocol});

  Future<bool> auth() {
    return this.authProtocol.auth(
          _uri,
          _clientId,
          _scopes,
          _port,
          _secret,
          _redirectUri,
        );
  }
}
