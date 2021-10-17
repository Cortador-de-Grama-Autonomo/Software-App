import 'package:flutter/foundation.dart';

class PaymentManualModel {
  final String cpfCnpj;
  final String bank;
  final String agency;
  final String account;
  final String value;

  PaymentManualModel(
      {@required this.cpfCnpj,
      @required this.bank,
      @required this.agency,
      @required this.account,
      @required this.value});

  factory PaymentManualModel.fromJson(Map<String, dynamic> json) {
    return PaymentManualModel(
      cpfCnpj: json['cpfCnpj'],
      bank: json['bank'],
      agency: json['agency'],
      account: json['account'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpfCnpj': this.cpfCnpj,
      'bank': this.bank,
      'agency': this.agency,
      'account': this.account,
      'value': this.value,
    };
  }
}
