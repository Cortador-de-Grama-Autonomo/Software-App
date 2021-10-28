import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/main_tile.dart';
import 'package:flutter/widgets.dart';

class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: <Widget>[
        MainTile(
          title: 'Ler Qr Code',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.STATIC_QR_CODE);
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
