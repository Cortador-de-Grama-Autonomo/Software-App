import 'dart:convert';
import 'package:app/services/api.dart';
import 'package:http/http.dart';

import 'home.controller.dart';

class KeyAdressingController {
  KeyAdressingController._privateConstructor();
  final api = new Api();

  static final KeyAdressingController _instance =
      KeyAdressingController._privateConstructor();

  factory KeyAdressingController() {
    return _instance;
  }


  Future<dynamic> getCutt({int id}) async {
    try {
      var response = await api.get(route: "/grassmachine");
      var responseValue = jsonDecode(response.body);

      return responseValue;
    } catch (error) {
      print(error);
    }
  }
}
