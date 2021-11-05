import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/button.dart';
import 'package:app/controller/key_adressing.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dispositivos_conectados.dart';


class GenerateAdressingKey extends StatefulWidget {
  @override
  _GenerateAdressingKeyState createState() => _GenerateAdressingKeyState();
}

class _GenerateAdressingKeyState extends State<GenerateAdressingKey> {
  initState() {
    super.initState();
    getCutter();
  }
  String response;
  String aaaa;
  KeyAdressingController cutterController = KeyAdressingController();

  void getCutter() async {
    try {
      var usernameResponse = await cutterController.getCutt(id: 1);
      setState(() {
        response = usernameResponse;
        print(response);
      });
    } catch (err) {
      print(err);
    }
  }



  bool _isButtonAvaible = false;
  final _nicknameController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            children: [
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _nicknameController,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Apelido do Cortador',
                      border: OutlineInputBorder(),
                      hintText: 'Ex.: Cortador Casa 1'),
                ),
              
              ),
              Card(
              color: lightColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Nº série: ${response[2]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: primaryColor)),
                  Text('90% de bateria restante',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: tertiartColor)),
                  Text('Modelo: ${response[4]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Potência: ${response[5]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Voltagem: ${response[6]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Motor: ${response[7]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Faixa de Corte: ${response[8]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Rotação: ${response[9]}',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  
                  ],
                ),
              ),
            ],
              ),
              
            ),
            ],
          ),
        ),
        Button(
          title: "Salvar",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AdressingKeyPage(nickname: 
                         _nicknameController.text,
                      )),
            );
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Cortador",
      body: body,
    );
  }
}
