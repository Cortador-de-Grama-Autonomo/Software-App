import 'package:app/theme/colors.dart';
import 'package:app/view/qr_codes/static/configuracoes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/button.dart';
import 'package:app/controller/key_adressing.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Corte extends StatefulWidget {
  @override
  _CorteState createState() => _CorteState();
}

class _CorteState extends State<Corte> {
  initState() {
    super.initState();
  }

  bool _isButtonAvaible = false;
  final _alturaController = TextEditingController();
  String selectedAltura;

  final altura = [
    "2 cm",
    "3 cm",
    "4 cm",
    "5 cm",
    "6 cm"
  ];




Padding renderAltura() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: 'Altura',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                hint: Text("Altura"),
                focusColor: Colors.red,
                value: selectedAltura,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    selectedAltura = newValue;
                  });
                },
                items: altura.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: darkColor),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }



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
                child: renderAltura()
              
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
                  builder: (context) => Configuracao(altura: 
                         _alturaController.text,
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
