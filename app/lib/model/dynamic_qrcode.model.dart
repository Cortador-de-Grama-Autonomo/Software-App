import 'package:flutter/foundation.dart';

class DynamicQrCodeModel {
  final int id;
  final String title;
  final String price;
  final String qr_code_dinamic_url;
  final String discount;
  final String fine;
  final String interest;
  final String payer_document;
  final String payer_name;
  final bool payable_after_duedate;
  final DateTime due_date;
  final String key;
  final String uri; 

  DynamicQrCodeModel({
    this.id,
    @required this.qr_code_dinamic_url,
    @required this.interest,
    @required this.fine,
    @required this.discount,
    @required this.payer_document,
    @required this.payable_after_duedate,
    @required this.price,
    @required this.title,
    @required this.due_date,
    @required this.payer_name,
    @required this.key,
    @required this.uri,
  });

  factory DynamicQrCodeModel.fromJson(Map<String, dynamic> json) {
    return DynamicQrCodeModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      qr_code_dinamic_url: json['qr_code_dinamic_url'],
      interest: json['interest'],
      fine: json['fine'],
      discount: json['discount'],
      payer_document: json['payer_document'],
      payable_after_duedate: json['payable_after_duedate'],
      due_date: json['due_date'],
      payer_name: json['payer_name'],
      key: json['key'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "price": this.price.toString(),
      "qr_code_dinamic_url": this.qr_code_dinamic_url,
      "interest": this.interest,
      "fine": this.fine,
      "discount": this.discount,
      "payer_document": this.payer_document,
      "payable_after_duedate": this.payable_after_duedate,
      "due_date": this.due_date,
      "payer_name": this.payer_name,
      "key": this.key,
      "uri": this.uri
    };
  }
}
