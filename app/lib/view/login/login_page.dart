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

final _email = TextEditingController();
final _senha = TextEditingController();



  Widget button() {
    return (new MaterialButton(
      height: 60.0,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      minWidth: 170.0,
      color: tertiartColor,
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
        Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
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
           Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50, bottom: 50),
              child: TextFormField(
                controller: _email,
                keyboardType: TextInputType.text,
                  autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 120, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _senha,
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
          FlatButton(
            onPressed: (){
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },
            padding: const EdgeInsets.only(
                  left: 0, right: 283, top: 190, bottom: 0),
            child: Text(
              'Esqueceu a senha?',
              style: TextStyle(color: tertiartColor, fontSize: 15),
            ),
          ),
          
      
          Center(child: Container(width: 170, child: button())),
        ],
      ),
    );
  }
}
