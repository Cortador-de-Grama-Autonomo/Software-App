import 'package:app/controller/home.controller.dart';
import 'package:app/controller/transaction.controller.dart';
import 'package:app/model/transaction.model.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/transaction_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool canScroll = true;
  List<TransactionModel> transactions = List<TransactionModel>();
  TransactionController transactionController = TransactionController();
  String balance = "0";
  HomeController homecontroller = HomeController();

  dynamic person;
  dynamic account;

  Future<void> getUserData() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // String personStorage = localStorage.getString('person');
    // String accountStorage = localStorage.getString('account');

    // setState(() {
    //   person = jsonDecode(personStorage);
    //   account = jsonDecode(accountStorage);

    // });
  }

  @override
  initState() {
    super.initState();
    getUserData().then((value) => {

      getTransactions(
        agencyNumber: account["branch_code"],
        accountNumber: account["account_number"]),
      getBalance(account["branch_code"], account["account_number"]),
       _scrollController.addListener(() {
      if (canScroll &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        getTransactions(
            isScroll: true,
            agencyNumber: account["branch_code"],
            accountNumber: account["account_number"]);
      }
    })

    });
    // getTransactions(
    //     agencyNumber: account["branch_code"],
    //     accountNumber: account["account_number"]);
    // getBalance(account["branch_code"], account["account_number"]);
    // _scrollController.addListener(() {
    //   if (canScroll &&
    //       _scrollController.position.pixels ==
    //           _scrollController.position.maxScrollExtent) {
    //     getTransactions(
    //         isScroll: true,
    //         agencyNumber: account["branch_code"],
    //         accountNumber: account["account_number"]);
    //   }
    // });
  }

  void getBalance(String agencyNumber, String accountNumber) async {

    try {
      String balanceResponse =
          await homecontroller.getBalance(agencyNumber, accountNumber);
      setState(() {
        balance = balanceResponse;
      });
    } catch (err) {
      setState(() {
        balance = "0";
      });
    }
  }

  void getTransactions(
      {isScroll = false, String agencyNumber, String accountNumber}) async {
    try {

      List<dynamic> response = await transactionController.getAllTransactions(
        agencyNumber,
        accountNumber,
      );

      setState(() {
        if (isScroll) {
          transactions = [...transactions, ...response];
        } else {
          transactions = [...response];
        }

        if (response.length != null ||
            response.length == 0 ||
            response.length < 8) {
          canScroll = false;
        }

        if (isScroll) {
          _page = _page + 1;
        } else {
          _page = 1;
        }
      });
    } catch (e) {
      setState(() {
        transactions = [];
      });

      throw Exception('Failed to get Transactions List From Server');
    }
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
                    'Saldo disponível',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "R\$ ${double.parse(balance).toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.headline1,
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
            itemCount: transactions.length != null ? transactions.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return TransactionTile(
                transactions[index],
              );
            },
          ))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: darkColor),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: body,
    );
  }
}
