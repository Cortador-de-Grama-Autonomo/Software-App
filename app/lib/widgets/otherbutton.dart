import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonOther extends StatelessWidget {
  final String title;
  final Function onPressed;

  ButtonOther({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 3,
        color: Theme.of(context).errorColor,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline2.fontFamily,
            fontSize: Theme.of(context).textTheme.headline2.fontSize,
            fontWeight: FontWeight.w600,
            color: lightColor,
          ),
        ),
      ),
    );
  }
}
