import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/services/api.dart';

class PasswordController {
  PasswordController._privateConstructor();
  final api = new Api();

  static final PasswordController _instance =
      PasswordController._privateConstructor();

  factory PasswordController() {
    return _instance;
  }

  Future<bool> validatePassword(String password) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String accountStorage = localStorage.getString('account');
    final account = jsonDecode(accountStorage);
    print(account);
    final response = await api.post(
        route: "/validate-password/",
        body: {"password": password, "accountId": account["id"]});
    print(jsonDecode(response.body));
    return jsonDecode(response.body)["isPasswordValid"];
  }
}
