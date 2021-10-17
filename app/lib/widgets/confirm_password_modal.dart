import 'package:app/controller/password.controller.dart';
import 'package:app/controller/payment_manual.controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordModal extends StatefulWidget {
  final Function confirmPassword;

  ConfirmPasswordModal(this.confirmPassword) : super();

  @override
  _ConfirmPasswordModalState createState() => _ConfirmPasswordModalState();
}

class _ConfirmPasswordModalState extends State<ConfirmPasswordModal> {
  final _confirmPasswordController = TextEditingController();

  String messageError = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirmar Senha',
        style: TextStyle(color: darkColor),
      ),
      content: TextFormField(
        obscureText: true,
        style: TextStyle(color: darkColor),
        controller: _confirmPasswordController,
        decoration: InputDecoration(
            counter: Text(
          messageError,
          style: TextStyle(color: dangerColor),
        )),
      ),
      actions: [
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Confirmar'),
          onPressed: () async {
            //SUCCESS, ERROR, FAIL
            String status =
                await widget.confirmPassword(_confirmPasswordController.text);

            //SUCCESS, ERROR, FAIL
            switch (status) {
              case "SUCCESS":
                Navigator.of(context).pushNamed(
                  AppRoutes.SUCCESS_SCREEN,
                );
                break;
              case "ERROR":
                Navigator.of(context).pushNamed(
                  AppRoutes.ERROR_SCREEN,
                );
                break;
              case "FAIL":
              default:
                setState(() {
                  messageError = 'Senha Inválida';
                });
                break;
            }
          },
        )
      ],
    );
  }
}
