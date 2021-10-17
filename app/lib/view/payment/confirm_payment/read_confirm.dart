// import 'package:app/controller/payment_manual.controller.dart';
// import 'package:app/theme/colors.dart';
// import 'package:app/widgets/base_screen.dart';
// import 'package:app/widgets/button.dart';
// import 'package:app/widgets/confirm_password_modal.dart';
// import 'package:flutter/rendering.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';

// class ReadConfirm extends StatefulWidget {
//   final String nameText, valueText, keyValue;
//   ReadConfirm({Key key, this.valueText, this.nameText, this.keyValue})
//       : super(key: key);

//   @override
//   _ReadConfirmState createState() => _ReadConfirmState();
// }

// class _ReadConfirmState extends State<ReadConfirm> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<String> confirmPassword(String password) async {
//     final paymentController = PaymentManualController();

//     Response response = await paymentController.insertPaymentKey(
//       paymentData: {
//         "keyValue": widget.keyValue,
//         "value": widget.valueText,
//       },
//       password: password,
//     );

//     if (response.statusCode == 201) {
//       return "SUCCESS";
//     } else if (response.statusCode == 401) {
//       return "FAIL";
//     } else {
//       return "ERROR";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget body = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(padding: EdgeInsets.all(20)),
//               Text(
//                 'Valor: ',
//                 style: new TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                     color: secondaryColor),
//               ),
//               Text(
//                 "R\$ ${widget.valueText}",
//                 style: new TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 42,
//                     color: primaryColor),
//               ),
//               Text(
//                 DateFormat('dd/MM/yyyy').format(DateTime.now()),
//                 style: new TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: darkColor),
//               ),
//               Padding(padding: EdgeInsets.all(20)),
//               Text(
//                 "${widget.nameText}",
//                 style: new TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 24,
//                     color: primaryColor),
//               ),
//               Padding(padding: EdgeInsets.all(20)),
//               Text(
//                 'Chave: ',
//                 style: new TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                     color: secondaryColor),
//               ),
//               Text(
//                 "${widget.keyValue}",
//                 style: new TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 24,
//                     color: primaryColor),
//               ),
//             ],
//           ),
//         ),
//         Button(
//           title: "Pagar",
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (_) => ConfirmPasswordModal(confirmPassword),
//             );
//           },
//         ),
//       ],
//     );

//     return BaseScreen(
//       topTitle: "Confirmar ",
//       bottomTitle: "Pagamento",
//       body: body,
//     );
//   }
// }
