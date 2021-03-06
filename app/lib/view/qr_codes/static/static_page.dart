import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeReader extends StatefulWidget {
  QRCodeReader({key}) : super(key: key);

  @override
  _QRCodeReaderState createState() => _QRCodeReaderState();
}

class _QRCodeReaderState extends State<QRCodeReader> {
  String ticket = '';
  List<String> tickets = [];

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    print(code);
    setState(() => ticket = code != '-1' ? code : 'Não validado');

    // Stream<dynamic>? reader = FlutterBarcodeScanner.getBarcodeStreamReceiver(
    //   "#FFFFFF",
    //   "Cancelar",
    //   false,
    //   ScanMode.QR,
    // );
    // if (reader != null)
    //   reader.listen((code) {
    //     setState(() {
    //       if (!tickets.contains(code.toString()) && code != '-1')
    //         tickets.add(code.toString());
    //     });
    //   });
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             if (ticket != '')
//               Padding(
//                 padding: EdgeInsets.only(bottom: 24.0),
//                 child: Text(
//                   'Ticket: $ticket',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ElevatedButton.icon(
//               onPressed: readQRCode,
//               icon: Icon(Icons.qr_code),
//               label: Text('Validar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Ticket: $ticket',
                  style: TextStyle(fontSize: 20, color: darkColor),
                ),
              ),
            ElevatedButton.icon(
              onPressed: readQRCode,
              icon: Icon(Icons.qr_code),
              label: Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}
