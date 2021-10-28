import 'package:app/routes/app_routes.dart';
import 'package:app/services/auth/auth.dart';
import 'package:app/services/auth/keycloack_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:app/theme/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget button() {
    return (new MaterialButton(
      height: 60.0,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      minWidth: 170.0,
      color: primaryColor,
      textColor: lightColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(
            "Entrar",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.arrow_forward),
        ],
      ),
      onPressed: () async {
        // Auth auth = Auth(authProtocol: KeycloakAuth());
        // bool logged = await auth.auth();
        // if (logged) {
        //   Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
        // }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/fundo.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Center(child: Container(width: 170, child: button())),
        ],
      ),
    );
  }
}
