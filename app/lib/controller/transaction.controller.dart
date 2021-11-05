import 'dart:convert';
import 'package:app/model/notificacao.model.dart';
import 'package:app/services/api.dart';

class TransactionController {
  TransactionController._privateConstructor();
  final api = new Api();

  static final TransactionController _instance =
      TransactionController._privateConstructor();

  factory TransactionController() {
    return _instance;
  }

  Future<List<NotificacaoModel>> getNotificacoes(
      String agencyNumber, String accountNumber) async {
    try {
      var response = await api.get(
          route: '/notificacoes/');
      var responseValue = jsonDecode(response.body);

      var listReturn = responseValue
          .map<NotificacaoModel>((e) => NotificacaoModel.fromJson(e))
          .toList();
      return listReturn;
    } catch (e) {
      return [];
    }
  }
}
