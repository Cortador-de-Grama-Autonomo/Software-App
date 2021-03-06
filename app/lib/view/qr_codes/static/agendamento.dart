import 'package:app/theme/colors.dart';
import 'package:app/view/qr_codes/static/configuracoes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/button.dart';
import 'package:app/controller/key_adressing.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Agendar extends StatefulWidget {
  @override
  _AgendarState createState() => _AgendarState();
}

class _AgendarState extends State<Agendar> {
  initState() {
    super.initState();
  }

  bool _isButtonAvaible = false;
  final _dataControler = TextEditingController();
  final _horaControler = TextEditingController();
 

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
                  controller: _dataControler,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Data do Corte',
                      border: OutlineInputBorder(),
                      hintText: 'Ex.: 28 de Outubro de 2021'),
                ),
              
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _horaControler,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Hor??rio do Corte',
                      border: OutlineInputBorder(),
                      hintText: 'Ex.: 13:00'),
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
                  builder: (context) => Configuracao(dados: {
                    'data': _dataControler.text,
                    'hora': _horaControler.text,
                  }  
                      )),
            );
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Agendar",
      bottomTitle: "Hor??rio",
      body: body,
    );
  }
}
