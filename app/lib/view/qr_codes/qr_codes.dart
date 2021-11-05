import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/main_tile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodePage extends StatefulWidget {
  QRCodePage({key}) : super(key: key);

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  initState() {
    super.initState();
    }
  String ticket = '';
  List<String> tickets = [];

    readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
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
  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: <Widget>[
        MainTile(
          title: 'Ler Qr Code',
          onTap: () {
            readQRCode();
            
          },
        ),
        MainTile(
          title: 'Dispositivos Conectados',
          onTap: () {
           Navigator.of(context).pushNamed(AppRoutes.ADRESSING_KEY);
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Cortador",
      bottomTitle: "",
      body: body,
    );
  }
}
