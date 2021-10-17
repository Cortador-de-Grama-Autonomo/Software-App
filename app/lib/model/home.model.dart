import 'package:flutter/foundation.dart';

class HomeModel {
  final String id;
  final String balance;

  HomeModel({
    this.id,
    @required this.balance,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      balance: json['balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': this.id, 'balance': this.balance};
  }
}
