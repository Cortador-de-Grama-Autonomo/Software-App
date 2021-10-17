// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

// class Api {
//   String token;
//   Api._privateConstructor();

//   static final Api _instance = Api._privateConstructor();

//   factory Api() {
//     return _instance;
//   }

//   // Future<String> getToken() async {
//   //   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   //   String token = localStorage.getString('token');
//   //   return token;
//   // }


//   static final headers = {"content-type": 'application/json'};

//   Future<http.Response> get({@required String route}) async {
//     // String token = await getToken();
//     var response = await http
//         .get(_url + route, headers: {...headers, "authorization": token});
//     if (response.statusCode != 200) {
//       throw response;
//     }
//     return response;
//   }

//   Future<http.Response> post(
//       {@required String route, @required dynamic body}) async {
//     // String token = await getToken();
//     return http.post(_url + route,
//         body: jsonEncode(body), headers: {...headers, "authorization": token});
//   }

//   Future<http.Response> put(
//       {@required String route, @required dynamic body}) async {
//     // String token = await getToken();
//     return http.put(_url + route,
//         body: jsonEncode(body), headers: {...headers, "authorization": token});
//   }

//   Future<http.Response> delete({@required String route}) async {
//     // String token = await getToken();

//     return http
//         .delete(_url + route, headers: {...headers, "authorization": token});
//   }
// }
