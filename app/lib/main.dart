import 'package:app/routes/routes.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  runApp(SmartApp());
}

class SmartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("pt-BR", null);
    return MaterialApp(
      title: 'Smart  Grass',
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
