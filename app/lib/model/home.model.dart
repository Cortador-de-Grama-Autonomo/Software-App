import 'package:flutter/foundation.dart';

class HomeModel {
  final String agendamento;
  final String apelido;

  HomeModel({
    this.agendamento,
    this.apelido
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      agendamento: json['agendamento'],
      apelido: json['apelido']
    );
  }

  Map<String, dynamic> toJson() {
    return {'agendamento': this.agendamento, 'apelido': this.apelido};
  }
}
