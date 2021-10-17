import 'package:app/routes/routes.dart';
import 'package:app/theme/theme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(BrbApp());
}

class BrbApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("pt-BR", null);
    return MaterialApp(
      title: 'Brb',
      theme: brbTheme,
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
