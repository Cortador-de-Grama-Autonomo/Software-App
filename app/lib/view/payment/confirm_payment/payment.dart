import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/confirm_password_modal.dart';
import 'package:flutter/rendering.dart';
import 'package:app/controller/payment_manual.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Payment extends StatefulWidget {
  final Map<String, String> paymentData;
  Payment({Key key, this.paymentData}) : super(key: key);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
  }

  final _paymentController = PaymentManualController();

  Future<String> confirmPassword(String password) async {
    Map<String, dynamic> paymentMethod = {
      'manual': _paymentController.insertPaymentManual,
      'key': _paymentController.insertPaymentKey
    };
    final paymentType = widget.paymentData['paymentType'];
    final response = await paymentMethod[paymentType](
        paymentData: widget.paymentData, password: password);

    if (response.statusCode == 201) {
      return "SUCCESS";
    } else if (response.statusCode == 401) {
      return "FAIL";
    } else {
      return "ERROR";
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirmar Pagamento',
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color: primaryColor),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Text(
                'Valor: ',
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: secondaryColor),
              ),
              Text(
                "${widget.paymentData['value']}",
                style: new TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                    color: primaryColor),
              ),
              Text(
                '25/08/2020',
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: darkColor),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Text(
                'Alberto João',
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: primaryColor),
              ),
              Text(
                'Banco:' + "${widget.paymentData['bank']}",
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: secondaryColor),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                'Agência :' + "${widget.paymentData['agency']}",
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: darkColor),
              ),
              Text(
                'Conta: ' + "${widget.paymentData['account']}",
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: darkColor),
              ),
              Text(
                'CNPJ: ' + "${widget.paymentData['cpf']}",
                style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: darkColor),
              ),
            ],
          ),
        ),
        Button(
          title: "Pagar",
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => ConfirmPasswordModal(confirmPassword),
            );
          },
        ),
      ],
    );

    return BaseScreen(
      body: body,
    );
  }
}
