import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/main_tile.dart';
import 'package:flutter/services.dart';
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

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    print(barcodeScanRes);
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: <Widget>[
        MainTile(
          title: 'Ler Qr Code',
          onTap: () {
          scanQR();
            
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
