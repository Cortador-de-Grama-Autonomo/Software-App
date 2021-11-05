import 'package:flutter/foundation.dart';

class KeyAdressing {
  final String id;
  final String name;
  final String serie_number;
  final String battery_percentage;
  final String model;
  final String power;
  final String voltage;
  final String motor_type;
  final String cut_type;
  final String rotation_number;
  final String qr_code_identifier;
  final String owner;

  KeyAdressing({@required this.id,
   @required this.name,
   @required this.serie_number,
   @required this.battery_percentage,
   @required this.model,
   @required this.power,
   @required this.voltage,
   @required this.motor_type,
   @required this.cut_type,
   @required this.rotation_number,
   @required this.qr_code_identifier,
   @required this.owner,
   });

  factory KeyAdressing.fromJson(Map<String, dynamic> json) {
    return KeyAdressing(
      name: json['name'],
      serie_number: json['serie_number'],
      battery_percentage: json['battery_percentage'],
      model: json['model'],
      power: json['power'],
      voltage: json['voltage'],
      motor_type: json['motor_type'],
      cut_type: json['cut_type'],
      rotation_number: json['rotation_number'],
      qr_code_identifier: json['qr_code_identifier'],
      owner: json['owner']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'serie_number': this.serie_number,
      'battery_percentage': this.battery_percentage,
      'model': this.model,
      'power': this.power,
      'voltage': this.voltage,
      'motor_type': this.motor_type,
      'cut_type': this.cut_type,
      'rotation_number': this.rotation_number,
      'qr_code_identifier': this.qr_code_identifier,
      'owner': this.owner
    };
  }
}
