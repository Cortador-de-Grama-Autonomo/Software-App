import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/view/payment/confirm_payment/payment.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentManual extends StatefulWidget {
  @override
  _PaymentManualState createState() => _PaymentManualState();
}

class _PaymentManualState extends State<PaymentManual> {
  initState() {
    super.initState();
  }

  Function onPressed;

  final _accountController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _agencyController = TextEditingController();
  final _valueController = TextEditingController();
  String selectedBank;
  final banks = [
    "BRB",
    "Banco do Brasil",
    "Caixa",
    "Santander",
    "Itaú",
    "Nubank",
    "Inter"
  ];

  Container bola(){
    return  Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Column renderCPfCnpj() {
    return Column(
      children: [
            Container(
          child: RaisedButton( 
            color: lightColor,
          child:  Card(
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
                    'Atenção',
                    style: Theme.of(context).textTheme.headline4.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Cortador de grama com baixo...',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
                    ),
                  Text(
                    '27 Out 2021',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:tertiartColor)
                  ),
          
                  SizedBox(height: 16),
                ],
              ),
            ),
            
          ],
        ),
      ),
      onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.TRANSACTIONS);}
      ),
    ),
        Container(
          child: RaisedButton( 
            color: lightColor,
          child:  Card(
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
                    'Desvio',
                    style: Theme.of(context).textTheme.headline4.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Obstaculo encontrado!',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
                    ),
                  Text(
                    '27 Out 2021',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:tertiartColor)
                  ),
          
                  SizedBox(height: 16),
                ],
              ),
            ),
            
          ],
        ),
      ),
      onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.TRANSACTIONS);}
      ),
    ),
    Container(
          child: RaisedButton( 
            color: lightColor,
          child:  Card(
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
                    'Concluído',
                    style: Theme.of(context).textTheme.headline4.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Corte finalizado',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
                    ),
                  Text(
                    '27 Out 2021',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:tertiartColor)
                  ),
          
                  SizedBox(height: 16),
                ],
              ),
            ),
            
          ],
        ),
      ),
      onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.TRANSACTIONS);}
      ),
    ),
    Container(
          child: RaisedButton( 
            color: lightColor,
          child:  Card(
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
                    'Iniciado',
                    style: Theme.of(context).textTheme.headline4.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Cortador de grama iniciado',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
                    ),
                  Text(
                    '27 Out 2021',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:tertiartColor)
                  ),
          
                  SizedBox(height: 16),
                ],
              ),
            ),
            
          ],
        ),
      ),
      onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.TRANSACTIONS);}
      ),
    ),


      
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
              renderCPfCnpj(),

            ],
          ),
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Notificações",
      body: body,
    );
  }
}
