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
          title: 'Qr Code Estático',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.STATIC_QR_CODE);
          },
        ),
        MainTile(
          title: 'Qr Code Dinâmico',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.DYNAMIC_QR_CODE);
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "QR Codes",
      bottomTitle: "",
      body: body,
    );
  }
}
