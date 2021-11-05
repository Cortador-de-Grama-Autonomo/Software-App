import 'dart:convert';
import 'package:app/services/api.dart';
import 'package:app/store/user/user_store.dart';

final api = new Api();
final user = new UserStore();

class HomeController {
  HomeController._privateConstructor();

  static final HomeController _instance = HomeController._privateConstructor();

  factory HomeController() {
    return _instance;
  }

  Future<String> getUserName(String user) async {
    try{
       var response = await api.get(
          route: "/login");
      var responseValue = jsonDecode(response.body);
      return responseValue['username'].toString();
    } catch (error) {
      return "0";
      }
    }
  

  Future<String> getAgendamento(String agendamento) async {
    try {
      var response = await api.get(
          route: "/agendamento");
      var responseValue = jsonDecode(response.body);
      return responseValue[0]['agendamento'].toString();
    } catch (error) {
      return "0";
    }
  }


}
