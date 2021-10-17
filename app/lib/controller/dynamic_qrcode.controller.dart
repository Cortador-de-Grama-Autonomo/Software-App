// import 'dart:convert';

// import 'package:app/model/dynamic_qrcode.model.dart';
// import 'package:app/routes/app_routes.dart';
// import 'package:app/services/api.dart';
// import 'package:app/store/user/user_store.dart';

// final api = new Api();
// final user = UserStore();

// class DynamicQrcodeController {
//   DynamicQrcodeController._privateConstructor();

//   static final DynamicQrcodeController _instance =
//       DynamicQrcodeController._privateConstructor();

//   factory DynamicQrcodeController() {
//     return _instance;
//   }

//   Future<DynamicQrCodeModel> createDynamicQrCode(Map data) async {
//     final response = await api.post(route: "/dynamic-qrcode/", body: data);
//     var responseToJson = jsonDecode(response.body);
//     String uri = createDynamicQrcodeUri(name: data['payer_name'],price: data['price'], url: responseToJson['qr_code_dinamic_url'] );
    

//     if (response.statusCode == 201) {
//       DynamicQrCodeModel dynamic_qrcode_info = DynamicQrCodeModel(
//           id: responseToJson['id'],
//           discount: data['discount'],
//           fine: data['fine'],
//           interest: data['interest'],
//           payable_after_duedate: data['payable_after_duedate'],
//           payer_name: data['payer_name'],
//           price: data['price'],
//           qr_code_dinamic_url: responseToJson['qr_code_dinamic_url'],
//           title: data['title'],
//           payer_document: data['payer_document'],
//           due_date: DateTime.parse(data['due_date']),
//           key: responseToJson['key'],
//           uri: uri
//           );

//       return dynamic_qrcode_info;
//     } else {
//       throw jsonDecode(response.body);
//     }
//   }

//   Future<void> updateDynamicQrCode(Map data) async {
//     final response = await api.put(route: "/dynamic-qrcode/", body: data);

//     if (response.statusCode != 200) {
//       throw jsonDecode(response.body);
//     }
//   }

//   Future<List<DynamicQrCodeModel>> getDynamicQrcodeList(accountId) async {
//     final response = await api.get(route: '/dynamic-qrcode/$accountId');
//     final List decode = jsonDecode(response.body);

//     final List<DynamicQrCodeModel> dynamicsQrCodes = [];


//     decode.forEach((element) {
//       String uri = createDynamicQrcodeUri(name: element['payer_name'],price: element['price'], url: element['qr_code_dinamic_url'] );
//       DynamicQrCodeModel dynamic_qrcode_info = DynamicQrCodeModel(
//           id: element['id'],
//           discount: element['discount'],
//           fine: element['fine'],
//           interest: element['interest'],
//           payable_after_duedate: element['payable_after_duedate'],
//           payer_name: element['payer_name'],
//           price: element['price'],
//           qr_code_dinamic_url: element['qr_code_dinamic_url'],
//           title: element['title'],
//           payer_document: element['payer_document'],
//           due_date: DateTime.parse(element['due_date']),
//           key: element['key'],
//           uri: uri
//           );

//       dynamicsQrCodes.add(dynamic_qrcode_info);
//     });

//     return dynamicsQrCodes;
//   }

//   Future<Map> validateDynamicQrcode(String url) async {
//      final response = await api.post(route: '/dynamic-qrcode/validate/', body: {"payload": {"url": url}});
//      if(response.statusCode == 200){
//        return jsonDecode(response.body);
//      } else {
//        throw jsonDecode(response.body)['err'];
//      }
     
//   }

//   Map<String, String> getQrCodeRoutesList() {
//     return {
//       'Visualize': AppRoutes.SHOW_DYNAMIC_QR_CODE,
//       'Edit': AppRoutes.GENERATE_DYNAMIC_QR_CODE,
//       'Delete': '/dynamic-qrcode/'
//     };
//   }

//   String createDynamicQrcodeUri({String name, String price, String url}) {
//     String payloadFormatIndicator = '000201';
//     String pointOfInitiationMethod = "010212";
//     String merchantAcountInformationCode = '2673';
//     String merchantAcountInformationGui = '0014br.gov.bcb.pix';
//     String merchantAcountInformationUrl =
//         '2551$url';
//     String merchantCategoryCode = '52040000';
//     String transactionCurrency = '5303$price';
//     String countryCode = '5802BR';
//     String merchantName = '5913$name';
//     String merchantCity = '6008BRASILIA';
//     String additionalDataFieldTemplate = "62070503***";
//     String cRC16 = "63041D3D";

//     String staticQrCode = payloadFormatIndicator +
//         pointOfInitiationMethod+
//         merchantAcountInformationCode +
//         merchantAcountInformationGui +
//         merchantAcountInformationUrl +
//         merchantCategoryCode +
//         transactionCurrency +
//         countryCode +
//         merchantName +
//         merchantCity +
//         additionalDataFieldTemplate +
//         cRC16;

//     return staticQrCode;
//   }
// }
