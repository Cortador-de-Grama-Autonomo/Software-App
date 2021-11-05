import 'package:app/controller/home.controller.dart';
import 'package:app/controller/transaction.controller.dart';
import 'package:app/model/notificacao.model.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/transaction_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Notificacao extends StatefulWidget {
  @override
  _NotificacaoState createState() => _NotificacaoState();
}

class _NotificacaoState extends State<Notificacao> {
  ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool canScroll = true;
  List<NotificacaoModel> transactions = List<NotificacaoModel>();
  String balance = "0";

  dynamic person;
  dynamic account;


  @override
  initState() {
    super.initState();
  
  }


  

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Atenção',
                    style: Theme.of(context).textTheme.headline1,

                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '27/10/2021',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Cortador de grama com baixo nível de energia. Conecte o cortados a fonte de energia.",
                    style: Theme.of(context).textTheme.headline3.copyWith(color: darkColor)
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: transactions.length != null ? transactions.length : 0, itemBuilder: (BuildContext context, int index) {  },
          ))
        ],
      ),
    );

     return BaseScreen(
      body: body,
      
    );
  }
  
}
