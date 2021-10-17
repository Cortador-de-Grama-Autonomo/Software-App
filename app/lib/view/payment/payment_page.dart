import 'dart:convert';

import 'package:app/controller/dynamic_qrcode.controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/main_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'confirm_payment/read_confirm.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  DynamicQrcodeController _dynamicQrCodeController = DynamicQrcodeController();

  
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
    String dynamicQrCodeIdentifier = '010212';
    if (barcodeScanRes.contains(dynamicQrCodeIdentifier)){
      print("AQUI POSSIVEL ERRO");
      extractDynamicQrCode(barcodeScanRes);
    } else{
      extractStaticQrCode(barcodeScanRes);
    } 
  }

  void extractStaticQrCode(String barcodeScanRes){
     int initName = barcodeScanRes.indexOf("5913") + 4;
    String name = "";
    for (int i = initName; barcodeScanRes[i] != " "; i++) {
      name += barcodeScanRes[i];
    }

    int initValue = barcodeScanRes.indexOf("5303") + 4;
    String value = "";

    for (int i = initValue; barcodeScanRes[i] != "."; i++) {
      value += barcodeScanRes[i];
    }

    String keyValue = barcodeScanRes.split("0136")[1].split("52040000")[0];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ReadConfirm(
          nameText: name,
          valueText: value,
          keyValue: keyValue,
        ),
      ),
    );
  }
  
  void extractDynamicQrCode(String barcodeScanRes) async {
    String url = barcodeScanRes.split("2551")[1].split("52040000")[0];
    try {
      Map reponse = await _dynamicQrCodeController.validateDynamicQrcode(url);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ReadConfirm(
            nameText: reponse['txid'],
            valueText: reponse['valor']['final'],
            keyValue: reponse['chave'],
          ),
        ),
      );
    }catch(err){
      Navigator.of(context).pushNamed(AppRoutes.ERROR_SCREEN, arguments: err,);
    }
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
          title: 'Pagamento Manual',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.PAYMENT_MANUAL);
          },
        ),
        MainTile(
          title: 'Endereçamento',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.ADRESSING_PAYMENT);
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Pagamento",
      bottomTitle: "",
      body: body,
    );
  }
}
