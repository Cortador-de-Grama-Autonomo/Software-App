import 'package:app/controller/key_adressing.controller.dart';
import 'package:app/controller/static_qrcode.controller.dart';
import 'package:app/model/static_qrcode.model.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GenerateQr extends StatefulWidget {
  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  initState() {
    super.initState();
    getKey();
  }

  void dispose() {
    _tituloController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  bool _isButtonAvaible = false;

  StaticQrcodeController staticQrcodeController = StaticQrcodeController();

  final _tituloController = TextEditingController();
  final _valorController = TextEditingController();

  KeyAdressingController keyAdressingController = KeyAdressingController();

  var selectedKey;

  List<dynamic> adressingKey = List<dynamic>();

  void getKey() async {
    try {
      List<dynamic> adressingKeyResponse =
          await staticQrcodeController.getKeyAdressing(accountId: 1);
      setState(() {
        adressingKey = adressingKeyResponse;
      });

    } catch (err) {
      print('erro em mostrar chave');
      print(err);
    }
  }

  Future<void> createStaticQrCode(context) async {
    Function getStaticQrCodeList = ModalRoute.of(context).settings.arguments;

    try {
      StaticQrCodeModel qrCode =
          await staticQrcodeController.createStaticQrCode(
        title: _tituloController.text,
        price: double.parse(_valorController.text).toStringAsFixed(2),
        key: adressingKey.firstWhere((element) => element["key"]==selectedKey)
      );

      getStaticQrCodeList();
      Navigator.pushNamed(
        context,
        AppRoutes.SHOW_STATIC_QR,
        arguments: qrCode,
      );
      
    } catch (err) {
      alertError(context);
    }
  }

  void verifyInputHasText(text) {
    if (_tituloController.text != '' && _valorController.text != '') {
      setState(() {
        _isButtonAvaible = true;
      });
    } else {
      setState(() {
        _isButtonAvaible = false;
      });
    }
  }

  Future<void> alertError(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Algo deu errado!',
            style:
                new TextStyle(fontWeight: FontWeight.normal, color: Colors.red),
          ),
          content: Text(
            'Não conseguimos gerar seu QR Code',
            style: new TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Tentar Novamente'),
              onPressed: () {
                Navigator.of(context).pop();
                _tituloController.clear();
                _valorController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 290,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onChanged: verifyInputHasText,
                  controller: _tituloController,
                  decoration: InputDecoration(
                      labelText: 'Titulo', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  controller: _valorController,
                  keyboardType: TextInputType.number,
                  onChanged: verifyInputHasText,
                  decoration: InputDecoration(
                      labelText: 'Valor', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Chave',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            hint: Text("Chave"),
                            focusColor: Colors.red,
                            value: selectedKey,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                selectedKey = newValue;
                                print(newValue);
                                
                              });
                            },
                            items: adressingKey
                                .map((e) => e["key"])
                                .toList()
                                .map((value) {    
                                  print(adressingKey);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
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
                  )),
            ],
          ),
        ),
        Button(
            title: "Criar",
            onPressed:
                _isButtonAvaible ? () => createStaticQrCode(context) : null),
      ],
    );

    return BaseScreen(
      topTitle: "Gerar",
      bottomTitle: "QR code",
      body: body,
    );
  }
}
