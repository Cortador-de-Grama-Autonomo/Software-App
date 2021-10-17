import 'dart:convert';
import 'package:app/services/api.dart';
import 'package:http/http.dart';

class KeyAdressingController {
  KeyAdressingController._privateConstructor();
  final api = new Api();

  static final KeyAdressingController _instance =
      KeyAdressingController._privateConstructor();

  factory KeyAdressingController() {
    return _instance;
  }

  void generateKeyAdressing({String key, String keyType, int accountId}) async {
    Response response = await api.post(route: "/key", body: {
      "key": key,
      "key_type": keyType,
      "account_id": accountId,
    });
    if (response.statusCode != 200) {
      throw jsonDecode(response.body);
    }
  }

  Future<List<dynamic>> getKeyAdressing({int accountId}) async {
    try {
      var response = await api.get(route: "/key/$accountId");
      var responseValue = jsonDecode(response.body);

      return responseValue;
    } catch (error) {
      print(error);
      return new List<dynamic>();
    }
  }
}
