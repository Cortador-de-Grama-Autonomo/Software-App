import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LinearSales {
  final int month;
  final double price;
  final int id;
  final String name;

  LinearSales(
      {@required this.month,
      @required this.price,
      @required this.id,
      @required this.name});

  factory LinearSales.fromJson(Map<String, dynamic> json) {
    return LinearSales(
        month: json['month'],
        price: json['price'] is int ? json['price'].toDouble() : json['price'],
        id: json['id'],
        name: json['name']);
  }
}
