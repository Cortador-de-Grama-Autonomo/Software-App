import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}
 
class _ScanScreenState extends State<ScanScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
 
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


   void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      //do something
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
       body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}