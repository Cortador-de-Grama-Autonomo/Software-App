import 'package:app/model/user.model.dart';
import 'package:flutter/foundation.dart';

class MerchantAccountInformationModel {
  final String gui;
  final String chave;
  final UserModel user;

  MerchantAccountInformationModel(
      {@required this.gui, @required this.chave, @required this.user});
}
