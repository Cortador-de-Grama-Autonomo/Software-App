import 'package:app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  goTo() {
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE),
    );
  }

  initState() {
    super.initState();
    goTo();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Theme(
        data: new ThemeData(
          brightness: Brightness.dark,
          inputDecorationTheme: new InputDecorationTheme(
            labelStyle: new TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            SplashScreen(
              seconds: 3,
              backgroundColor: Colors.white,
              loaderColor: Colors.transparent,
            ),
            FadeTransition(
              opacity: animation,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 16.0),
                      child: Image(
                        image: AssetImage('lib/assets/images/logo-app.png'),
                        width: 240,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
