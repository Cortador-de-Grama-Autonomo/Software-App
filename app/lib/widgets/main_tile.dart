import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainTile extends StatelessWidget {
  final String title;
  final Function onTap;

  MainTile({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline2.fontFamily,
            fontSize: Theme.of(context).textTheme.headline2.fontSize,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        onTap: onTap,
        trailing: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).primaryColorLight,
          size: 32,
        ),
      ),
    );
  }
}
