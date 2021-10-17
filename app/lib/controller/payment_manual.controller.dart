// import 'package:app/services/api.dart';
// import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

// class PaymentManualController {
//   PaymentManualController._privateConstructor();
//   final api = new Api();
//   static final PaymentManualController _instance =
//       PaymentManualController._privateConstructor();

//   factory PaymentManualController() {
//     return _instance;
//   }
//   dynamic account;

//   // Future<void> getAccountData() async {
//   //   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   //   String accountStorage = localStorage.getString('account');
//   //   this.account = jsonDecode(accountStorage);
//   // }

//   Future<http.Response> insertPaymentManual(
//       {Map<String, dynamic> paymentData, String password}) async {
//     // await this.getAccountData();
//     return await api.post(
//       route: "/paymentorder",
//       body: {
//         "receiver_user_cpf_cnpj": paymentData['cpf'],
//         "receiver_user_bank": paymentData['bank'],
//         "receiver_user_agency": paymentData['agency'],
//         "receiver_user_account": paymentData['account'],
//         "value": double.parse(paymentData['value']),
//         "receiver_user_account_type": "CACC",
//         "password": password,
//         "account_id": this.account["id"]
//       },
//     );
//   }

//   Future<http.Response> insertPaymentKey(
//       {Map<String, dynamic> paymentData, String password}) async {
//     // await this.getAccountData();
//     return await api.post(
//       route: "/paymentorder/key",
//       body: {
//         "key": paymentData['keyValue'],
//         "value": double.parse(paymentData['value']),
//         "password": password,
//         "account_id": this.account["id"]
//       },
//     );
//   }
// }
