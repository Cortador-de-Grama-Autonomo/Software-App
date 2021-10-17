import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String message = ModalRoute.of(context).settings.arguments;

    return BaseScreen(
      topTitle: message != null ? message : "Operação realizada com sucesso",
      bottomTitle: "",
      dontHasBackButton: true,
      body: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image(
              image: AssetImage('lib/assets/images/success.png'),
            ),
            Button(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.HOME_PAGE, (Route<dynamic> route) => false);
              },
              title: "Confirmar",
            )
          ],
        ),
      ),
    );
  }
}
