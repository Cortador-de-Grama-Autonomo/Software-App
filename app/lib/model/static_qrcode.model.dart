import 'package:flutter/foundation.dart';

class StaticQrCodeModel {
  final int id;
  final String title;
  final String price;
  final int accountId;
  final String uri;
  final int keyId;
  final String key;

  StaticQrCodeModel({
    this.id,
    @required this.uri,
    @required this.title,
    @required this.price,
    @required this.accountId,
    this.keyId,
    this.key,
  });

  factory StaticQrCodeModel.fromJson(Map<String, dynamic> json) {
    return StaticQrCodeModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      accountId: json['account_id'],
      uri: json['uri'],
      keyId: json['key_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'price': double.parse(this.price),
      'account_id': this.accountId,
      'uri': this.uri,
      'key_id': this.keyId
    };
  }
}
