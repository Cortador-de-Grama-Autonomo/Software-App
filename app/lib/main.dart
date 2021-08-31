import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';

void main() {
  runApp(SmartGrass());
}

class SmartGrass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brb',
      theme: smartTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) => Routes.routes[settings.name](context),
          settings: settings,
        );
      },
    );
  }
}
