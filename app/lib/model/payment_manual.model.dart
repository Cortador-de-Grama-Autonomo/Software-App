import 'package:flutter/foundation.dart';

class PaymentManualModel {
  final String id;
  final String name;
  final String description;
  final String latitude;
  final String longitude;



  PaymentManualModel(
      {this.id,
      this.name,
      this.description,
      this.latitude,
      this.longitude
      });

  factory PaymentManualModel.fromJson(Map<String, dynamic> json) {
    return PaymentManualModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'latitude': this.latitude,
      'longitude': this.longitude,

    };
  }
}
