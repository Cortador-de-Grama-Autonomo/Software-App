import 'package:app/model/key_adressing.model.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/general_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/controller/key_adressing.controller.dart';

class AdressingKeyPage extends StatefulWidget {
  final String nickname;
  AdressingKeyPage({Key key, this.nickname})
      : super(key: key);
  @override
  _AdressingKeyPageState createState() => _AdressingKeyPageState();
}

class _AdressingKeyPageState extends State<AdressingKeyPage> {
  initState() {
    super.initState();
    // getKey();
  }

  // KeyAdressingController keyAdressingController = KeyAdressingController();

  List<dynamic> adressingKey = List<dynamic>();

  // void getKey() async {
  //   try {
  //     List<dynamic> adressingKeyResponse = await keyAdressingController.getKeyAdressing(accountId: 1);
  //     setState(() {
  //       adressingKey = adressingKeyResponse;
  //     });
  //   } catch (err) {
  //     print('erro em mostrar chave');
  //     print(err);
  //   }
  // }
  bool _isVisible = true;

  void showToast() {
      setState(() {
        _isVisible = !_isVisible;
      });
    }
  

  @override
  Widget build(BuildContext context) {
    Widget _getTile(String title, String subtitle) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 85,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(60, 0, 0, 0),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.headline3.fontFamily,
                fontSize: Theme.of(context).textTheme.headline3.fontSize,
                color: Theme.of(context).primaryColor),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline2.fontFamily,
              fontSize: Theme.of(context).textTheme.headline2.fontSize,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      );
    }

    Widget body = Stack(
      children: [
        ListView(
          children:  <Widget>[
            Visibility(
              visible: _isVisible,
              child: Card(
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
                  Text(widget.nickname != null ? widget.nickname : 'Cortador do jardim',
                  style: Theme.of(context).textTheme.headline2.copyWith(color: primaryColor)),
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
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
          onSelected: (value) => {
            setState(() {
              if (value == "Editar") {
                Navigator.of(context).pushNamed(AppRoutes.GENERATE_ADRESSING_KEY);
              } else if (value == "Deletar") {
                showToast();
              }
            })
          },
          itemBuilder: (BuildContext context) {
            return ["Editar", "Deletar"].map((String testString) {
              return PopupMenuItem(
                value: testString,
                child: Text(
                  testString,
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }).toList();
          },
              ),
                ],
              ),
              
            ),
            ),
          ],
             
        ),
        Positioned(
          bottom: 30,
          right: 0,
          child: FloatingActionButton(
            backgroundColor: Color(0xff003E7E),
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.GENERATE_ADRESSING_KEY);
            },
          ),
        )
      ],
    );

    return BaseScreen(
      body: body,
      topTitle: "Dispositivos ",
      bottomTitle: "Conectados",
    );
  }
}
