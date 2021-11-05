import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String token;
  Api._privateConstructor();

  static final Api _instance = Api._privateConstructor();

  factory Api() {
    return _instance;
  }



  final String _url = "https://cortador-api.herokuapp.com";

  static final headers = {"content-type": 'application/json'};

  Future<http.Response> get({@required String route}) async {
    var response = await http
        .get(_url + route);
    if (response.statusCode != 200) {
      throw response;
    }
    return response;
  }

  Future<http.Response> post(
      {@required String route, @required dynamic body}) async {
    return http.post(_url + route,
        body: jsonEncode(body));
  }

  Future<http.Response> put(
      {@required String route, @required dynamic body}) async {
    return http.put(_url + route,
        body: jsonEncode(body));
  }

  Future<http.Response> delete({@required String route}) async {
    return http
        .delete(_url + route, headers: {...headers, "authorization": token});
  }
}