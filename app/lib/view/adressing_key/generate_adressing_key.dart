import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/button.dart';
import 'package:app/controller/key_adressing.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GenerateAdressingKey extends StatefulWidget {
  @override
  _GenerateAdressingKeyState createState() => _GenerateAdressingKeyState();
}

class _GenerateAdressingKeyState extends State<GenerateAdressingKey> {
  initState() {
    super.initState();
  }

  bool _isButtonAvaible = false;
  String selectedKeyType;
  final keyTypes = ["CPF/CNPJ", "Email", "Celular"];


  final _keyController = TextEditingController();

  void verifyInputHasText(text) {
    if (selectedKeyType != '' && _keyController.text != '') {
      setState(() {
        _isButtonAvaible = true;
      });
    } else {
      setState(() {
        _isButtonAvaible = false;
      });
    }
  }

  void dispose() {
    _keyController.dispose();
    super.dispose();
  }

  void generateAdressingKey(BuildContext context) async {
    try {
      String key = _keyController.text;
      String keyType = selectedKeyType;
      int accountId = 1;
      // keyAdressingController.generateKeyAdressing(
      //     key: key, keyType: keyType, accountId: accountId);
      Navigator.of(context).popAndPushNamed(AppRoutes.SUCCESS_SCREEN,
          arguments: "Chave gerada com sucesso!");
    } catch (err) {
      Navigator.of(context)
          .popAndPushNamed(AppRoutes.ERROR_SCREEN, arguments: err["message"]);
    }
  }

  Widget renderInputType() {
    switch (selectedKeyType) {
      case "CPF/CNPJ":
        return TextField(
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
          
          controller: _keyController,
          keyboardType: TextInputType.number,
          onChanged: verifyInputHasText,
          decoration: InputDecoration(
            hintText: 'XXX.XXX.XXX-XX',
            labelText: 'Cpf',
            border: OutlineInputBorder(),
          ),
        );
      case "Email":
        return TextField(
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
          controller: _keyController,
          keyboardType: TextInputType.multiline,
          onChanged: verifyInputHasText,
          decoration: InputDecoration(
            hintText: 'exemplo@email.com',
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        );
      case "Celular":
        return TextField(
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
          controller: _keyController,
    
          keyboardType: TextInputType.number,
          onChanged: verifyInputHasText,
          decoration: InputDecoration(
            hintText: '(99) 9 9999-9999',
            labelText: 'Celular',
            border: OutlineInputBorder(),
          ),
        );
      default:
        return Container();
    }
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
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          hint: Text("Tipo da chave de endereçamento"),
                          focusColor: Colors.red,
                          value: selectedKeyType,
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              selectedKeyType = newValue;
                              _keyController.clear();
                            });
                            verifyInputHasText(newValue);
                          },
                          items: keyTypes.map((String value) {
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
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: renderInputType(),
              )
            ],
          ),
        ),
        Button(
          title: "Criar",
          onPressed:
              _isButtonAvaible ? () => generateAdressingKey(context) : null,
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Criar Chave de",
      bottomTitle: "Endereçamento",
      body: body,
    );
  }
}
