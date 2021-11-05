import 'package:app/services/api.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PaymentManualController {
  PaymentManualController._privateConstructor();
  final api = new Api();
  static final PaymentManualController _instance =
      PaymentManualController._privateConstructor();

  factory PaymentManualController() {
    return _instance;
  }
  dynamic account;
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   String accountStorage = localStorage.getString('account');
  //   this.account = jsonDecode(accountStorage);
  // }


  Future<http.Response> insertMapa(
      {Map<String, dynamic> rota}) async {
    // await this.getAccountData();
    return await api.post(
      route: "/rota",
      body: {
        "nome_local": rota['nome'],
      },
    );
  }
}
