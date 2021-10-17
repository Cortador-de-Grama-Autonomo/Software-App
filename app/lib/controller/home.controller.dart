import 'dart:convert';
import 'package:app/services/api.dart';
import 'package:app/store/user/user_store.dart';

final api = new Api();
final user = new UserStore();

class HomeController {
  HomeController._privateConstructor();

  static final HomeController _instance = HomeController._privateConstructor();

  factory HomeController() {
    return _instance;
  }

  Future<String> getBalance(String agency, String account) async {
    try {
      var response = await api.get(
          route: "/account/balance?agency=$agency&account=$account");
      var responseValue = jsonDecode(response.body);
      return responseValue[0]['Saldo'].toString();
    } catch (error) {
      return "0";
    }
  }

  Future<String> getCashIN(String agency, String account) async {
    var now = new DateTime.now();

    try {
      var response = await api.get(
          route:
              "/account/cash-in/?agencia=$agency&conta=$account&ano=${now.year}&mes=${now.month - 1}");
      var responseValue = jsonDecode(response.body);
      return responseValue['entrada'].toString();
    } catch (error) {
      return "0";
    }
  }

  Future<String> getCashOut(String agency, String account) async {
    var now = new DateTime.now();

    try {
      var response = await api.get(
          route:
              "/account/cash-out/?agencia=$agency&conta=$account&ano=${now.year}&mes=${now.month}");
      var responseValue = jsonDecode(response.body);
      return responseValue['saida'].toString();
    } catch (error) {
      return "0";
    }
  }
}
