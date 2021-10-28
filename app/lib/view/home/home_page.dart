import 'dart:convert';

import 'package:app/controller/home.controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/store/user/user_store.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/buttonWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



final user = UserStore();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // HomeController homecontroller = HomeController();
  String balance = "0";
  String cashIn = "0";
  String cashOut = "0";
  dynamic account;

  Future<void> getUserData() async {

  }

  @override
  initState() {
    super.initState();
    print("atualizou");

    // getUserData().then((value) =>
    //     {getBalance(account["branch_code"], account["account_number"])});
  }

  // void getBalance(String agencyNumber, String accountNumber) async {
  //   try {
  //     String balanceResponse =
  //         await homecontroller.getBalance(agencyNumber, accountNumber);
  //     setState(() {
  //       balance = balanceResponse;
  //     });

  //     String cashInResponse =
  //         await homecontroller.getCashIN(agencyNumber, accountNumber);
  //     setState(() {
  //       cashIn = cashInResponse;
  //     });

  //     String cashOutResponse =
  //         await homecontroller.getCashOut(agencyNumber, accountNumber);
  //     setState(() {
  //       cashOut = cashOutResponse;
  //     });
  //   } catch (err) {}
  // }

  InkWell renderBalanceCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.TRANSACTIONS);
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
                  Text(
                    'Saldo disponível',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "R\$ ${double.parse(balance).toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(height: 16),
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
                    'Bom dia Nalu!',
                    style: Theme.of(context).textTheme.headline1.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Cortador conectado: ',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
                    ),
                  Text(
                    'Horário de corte:  10:00',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:tertiartColor)
                  ),
          
                  SizedBox(height: 16),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ligar'),
              Text('Desligar'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Pausar cortador'),
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
                          icon: Icons.payment,
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
                          icon: Icons.vpn_key,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.ADRESSING_KEY);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ButtonWithIcon(
                          title: 'Configurações',
                          icon: Icons.timeline,
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
