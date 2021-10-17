import 'package:app/theme/colors.dart';
import 'package:app/view/payment/confirm_payment/payment.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/confirm_password_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddressingPayment extends StatefulWidget {
  @override
  _AdressingPaymentState createState() => _AdressingPaymentState();
}

final _cpfCnpjController = TextEditingController();
final _keyValueController = TextEditingController();
final _valueController = TextEditingController();



class _AdressingPaymentState extends State<AddressingPayment> {
  initState() {
    super.initState();
  }

  String selectedKeyType;
  final keyTypes = ["CPF/CNPJ", "Email", "Celular"];

  Padding renderCpfCnpj() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        controller: _cpfCnpjController,
        
        keyboardType: TextInputType.text,
        autofocus: true,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
        decoration: InputDecoration(
            labelText: 'CPF/CNPJ',
            border: OutlineInputBorder(),
            hintText: 'XXX.XXX.XXX-XX'),
      ),
    );
  }


  Padding renderKeyValue() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        controller: _keyValueController,
        keyboardType: TextInputType.text,
        autofocus: true,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
        decoration: InputDecoration(
          labelText: 'Chave',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Padding renderValue() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        controller: _valueController,
        keyboardType: TextInputType.number,
        autofocus: true,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
        decoration: InputDecoration(
            labelText: 'Valor', border: OutlineInputBorder(), hintText: 'R\$ '),
      ),
    );
  }

  confirmNavigation() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Payment( paymentData:{
          'cpf': _cpfCnpjController.text,
          'keyValue': _keyValueController.text,
          'value': _valueController.text,
          'paymentType': 'key'
        }
          
        ),
      ),
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
              renderKeyValue(),
              renderValue(),
            ],
          ),
        ),
        Button(
          title: "Confirmar",
          onPressed: () {
            confirmNavigation();
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Fazer",
      bottomTitle: "Pagamento",
      body: body,
    );
  }
}
