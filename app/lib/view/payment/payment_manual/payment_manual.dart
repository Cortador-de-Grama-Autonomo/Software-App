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

  Padding renderCPfCnpj() {
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

  Padding renderBank() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: 'Banco',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                hint: Text("Banco"),
                focusColor: Colors.red,
                value: selectedBank,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    selectedBank = newValue;
                  });
                },
                items: banks.map((String value) {
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
      ),
    );
  }

  Padding renderAgency() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        controller: _agencyController,
        
        keyboardType: TextInputType.text,
        autofocus: true,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
        decoration: InputDecoration(
            labelText: 'Agência',
            border: OutlineInputBorder(),
            hintText: 'XXXX-X'),
      ),
    );
  }

  Padding renderAccount() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        controller: _accountController,
        keyboardType: TextInputType.text,
        autofocus: true,
        
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
        decoration: InputDecoration(
            labelText: 'Conta',
            border: OutlineInputBorder(),
            hintText: 'XXXXXXX-X'),
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
              renderBank(),
              renderAgency(),
              renderAccount(),
              renderValue(),
            ],
          ),
        ),
        Button(
          title: "Confirmar",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Payment(paymentData: {
                        'cpf': _cpfCnpjController.text,
                        'account': _accountController.text,
                        'agency': _agencyController.text,
                        'value': _valueController.text,
                        'bank': selectedBank,
                        'paymentType': 'manual'
                      })),
            );
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
