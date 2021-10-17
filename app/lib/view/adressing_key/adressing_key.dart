import 'package:app/model/key_adressing.model.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/controller/key_adressing.controller.dart';

class AdressingKeyPage extends StatefulWidget {
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
          children: adressingKey.map((e) => _getTile(e["key_type"], e["key"])).toList(),
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
      topTitle: "Chaves de ",
      bottomTitle: "Endereçamento",
    );
  }
}
