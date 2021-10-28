import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/button.dart';
import 'package:app/controller/key_adressing.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dispositivos_conectados.dart';


class GenerateAdressingKey extends StatefulWidget {
  @override
  _GenerateAdressingKeyState createState() => _GenerateAdressingKeyState();
}

class _GenerateAdressingKeyState extends State<GenerateAdressingKey> {
  initState() {
    super.initState();
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
                  Text('Nº série 115LH2O-O',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: primaryColor)),
                  Text('90% de bateria restante',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: tertiartColor)),
                  Text('Modelo: SMARTGRASS-MC-40L-1800W',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Potência: 1800w',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Voltagem: 220v',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Motor: Monofásico',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Faixa de Corte: variável',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Rotação: 60Hz',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: writeColor)),
                  Text('Rotação: 3600rpm',
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
