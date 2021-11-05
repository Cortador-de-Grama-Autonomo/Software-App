import 'dart:convert';

import 'package:app/controller/home.controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/store/user/user_store.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/buttonWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';



final user = UserStore();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homecontroller = HomeController();

  dynamic account;
  String username;
  String agendamento;

   Future<void> getUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String accountStorage = localStorage.getString('account');

    setState(() {
      account = jsonDecode(accountStorage);
    });
  }
  @override
  initState() {
    super.initState();
    print("atualizou");

  }

void getUserName() async {
    try {
      String usernameResponse = await homecontroller.getUserName(account);
      setState(() {
        username = usernameResponse;
      });
    } catch (err) {
      print(err);
    }
  }
  void getAgendamneto() async {
    try {
      String agendamentoKeyResponse = await homecontroller.getAgendamento(agendamento);
      setState(() {
        agendamento = agendamentoKeyResponse;
      });
    } catch (err) {
      print(err);
    }
  }


  InkWell renderBalanceCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.MAPA);
      },
      child: Card(
        elevation: 3,
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
                   Container(
                    height: 110,
                    alignment: Alignment.centerLeft,
                    child: FlutterMap(
                    options: MapOptions(

                      // Coordenada central do mapa.
                        center: LatLng(-15.799862, -47.864195),
                        // Quantidade de zoom do mapa.
                        zoom: 15),
                    layers: [
                      // Url do mapa.
                      TileLayerOptions(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
              ],
            ),
            ),
             
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(8.0),
                  bottomRight: const Radius.circular(8.0),
                ),
              ),
              child: Text(
                'Rota Atual:          Praça Norte',
                style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column renderHomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
        elevation: 3,
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
                  Text(
                    'Bom dia ${account}!',
                    //['username']
                    style: Theme.of(context).textTheme.headline1.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Cortador conectado:  nada',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
                    ),
                  Text(
                    'Horário de corte: ${agendamento}',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:tertiartColor)
                  ),
          
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      ],
    );
  }

  Expanded renderIncomeCard() {
    return Expanded(
      flex: 2,
      child: Card(
        color: secondaryColor,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(Icons.power_settings_new,  color: Colors.white),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(padding: EdgeInsets.only()),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('    Ligar', style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white)),
                Text('    Desligar', style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white)),
                ],
              )
              
              
            ],
          ),
        ),
      ),
    );
  }

  Expanded renderOutCard() {
    return Expanded(
      flex: 2,
      child: Card(
        color: secondaryColor,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(Icons.pause,  color: Colors.white),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(padding: EdgeInsets.only()),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text('    Pausar', style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white)),
                ],
          ),
            ],
        ),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _screenSizeHeight = MediaQuery.of(context).size.height - 32;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _screenSizeHeight,
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    renderHomeHeader(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        renderIncomeCard(),
                        
                        Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                        renderOutCard()
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    renderBalanceCard(context),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        ButtonWithIcon(
                          title: 'Cortador',
                          icon: Icons.center_focus_weak,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.QR_CODE_PAGE);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ButtonWithIcon(
                          title: 'Notificações',
                          icon: Icons.info_outline,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.PAYMENT_MANUAL);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        ButtonWithIcon(
                          title: 'Mapeamento',
                          icon: Icons.map,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.MAPA);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ButtonWithIcon(
                          title: 'Configurações',
                          icon: Icons.settings,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.CONFIG);
                          },
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
