// import 'dart:convert';
// import 'package:app/model/transaction.model.dart';
// import 'package:app/services/api.dart';

// class TransactionController {
//   TransactionController._privateConstructor();
//   final api = new Api();

//   static final TransactionController _instance =
//       TransactionController._privateConstructor();

//   factory TransactionController() {
//     return _instance;
//   }

//   Future<List<TransactionModel>> getAllTransactions(
//       String agencyNumber, String accountNumber) async {
//     try {
//       var response = await api.get(
//           route: '/account/extract?agencia=$agencyNumber&conta=$accountNumber');
//       var responseValue = jsonDecode(response.body);

//       var listReturn = responseValue
//           .map<TransactionModel>((e) => TransactionModel.fromJson(e))
//           .toList();
//       return listReturn;
//     } catch (e) {
//       return [];
//     }
//   }
// }
