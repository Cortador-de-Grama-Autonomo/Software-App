import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  ButtonWithIcon({this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Row(
              children: [
                Icon(
                  icon,
                  color: lightColor,
                ),
                SizedBox(
                  width:
                      16, // here put the desired space between the icon and the text
                ),
                Text(title),
              ],
            ),
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}
