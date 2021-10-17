// import 'dart:convert';

// import 'package:app/model/static_qrcode.model.dart';
// import 'package:app/routes/app_routes.dart';
// import 'package:app/services/api.dart';
// import 'package:app/store/user/user_store.dart';

// final api = new Api();
// final user = UserStore();

// class StaticQrcodeController {
//   StaticQrcodeController._privateConstructor();

//   static final StaticQrcodeController _instance =
//       StaticQrcodeController._privateConstructor();

//   factory StaticQrcodeController() {
//     return _instance;
//   }

//   Future<StaticQrCodeModel> createStaticQrCode(
//       {String title, String price, Map key}) async {
//     String uri = this.createStaticQrcodeUri(
//       name: user.name,
//       price: price,
//       key: key["key"],
//     );
//     StaticQrCodeModel staticQrCode = StaticQrCodeModel(
//       accountId: 1,
//       price: price,
//       title: title,
//       uri: uri, 
//       key: key["key"],
//       keyId: key["id"],
//     );

//     await api.post(route: "/static-qrcode", body: staticQrCode.toJson());

//     return staticQrCode;
//   }

//   String createStaticQrcodeUri({String name, String price, String key}) {
//     String payloadFormatIndicator = '000201';
//     String merchantAcountInformationCode = '2658';
//     String merchantAcountInformationGui = '0014br.gov.bcb.pix';
//     String merchantAcountInformationKey =
//         '0136$key';
//     String merchantCategoryCode = '52040000';
//     String transactionCurrency = '5303$price';
//     String countryCode = '5802BR';
//     String merchantName = '5913$name';
//     String merchantCity = '6008BRASILIA';
//     String additionalDataFieldTemplate = "62070503***";
//     String cRC16 = "63041D3D";

//     String staticQrCode = payloadFormatIndicator +
//         merchantAcountInformationCode +
//         merchantAcountInformationGui +
//         merchantAcountInformationKey +
//         merchantCategoryCode +
//         transactionCurrency +
//         countryCode +
//         merchantName +
//         merchantCity +
//         additionalDataFieldTemplate +
//         cRC16;

//     return staticQrCode;
//   }

//   void editStaticQrCode(
//       {String title, String price, StaticQrCodeModel qrCode}) async {
//     final response =
//         await api.put(route: '/static-qrcode/' + qrCode.id.toString(), body: {
//       "price": price,
//       "title": title,
//     });

//     if (response.statusCode != 200) {
//       throw response.body;
//     }
//   }

//   Map<String, String> getQrCodeRoutesList() {
//     return {
//       'Visualize': AppRoutes.SHOW_STATIC_QR,
//       'Edit': AppRoutes.EDIT_STATIC_QR_CODE,
//       'Delete': '/static-qrcode/'
//     };
//   }

//   Future<List<dynamic>> getKeyAdressing({int accountId}) async {
//     try {
//       var response = await api.get(route:"/key/$accountId");
//       var responseValue = jsonDecode(response.body);
   
//       return responseValue;
//     } catch (error) {
//       print(error);
//       return new List<dynamic>();
//     }
//   }
// }
