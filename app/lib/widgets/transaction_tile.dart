import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:app/model/transaction.model.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'button.dart';

class TransactionTile extends StatefulWidget {
  final TransactionModel transaction;

  const TransactionTile(this.transaction);

  @override
  _TransactionTileState createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  static GlobalKey previewContainer = new GlobalKey();


  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: new BoxDecoration(
            color: lightColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close)),
                  Padding(padding: EdgeInsets.only(bottom: 12)),
                  RepaintBoundary(
                    key: previewContainer,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: lightColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "R\$ ${widget.transaction.price.toStringAsFixed(2) ?? ""}",
                            style: new TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 42,
                                color: primaryColor),
                          ),
                          Text(
                            DateFormat("d/MM/y", 'pt_Br').format(
                              DateTime.parse(widget.transaction.data ?? ""),
                            ),
                            style: new TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: darkColor,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                          Text(
                            '${widget.transaction.personName ?? ""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: primaryColor),
                          ),
                          Text(
                            'Banco: ${widget.transaction.bankName ?? ""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: secondaryColor),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            'Agência: ${widget.transaction.personAgency ?? ""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: darkColor),
                          ),
                          Text(
                            'Conta: ${widget.transaction.personAccount ?? ""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: darkColor),
                          ),
                          Text(
                            'Forma de pagamento: ${widget.transaction.payerMethod ?? ""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: darkColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Button(
                title: "Compartilhar",
                onPressed: () {
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _settingModalBottomSheet(context);
      },
      child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                      
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.transaction.entry ? "Entrada" : "Saída",
                          style: TextStyle(color: darkColor),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "R\$ ${widget.transaction.price.toStringAsFixed(2) ?? ""}",
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              color: primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        widget.transaction.data != null
                            ? Text(
                                DateFormat("d MMM y", 'pt_Br').format(
                                  DateTime.parse(widget.transaction.data),
                                ),
                                style: TextStyle(color: darkColor),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          Divider(
            height: 0,
            color: darkColor,
          ),
        ],
      ),
    );
  }
}
