import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseScreen extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final Widget body;
  final bool dontHasBackButton;
  final String pathCloseButton;

  BaseScreen({
    this.topTitle = "",
    this.bottomTitle = "",
    this.body,
    this.dontHasBackButton = false,
    this.pathCloseButton = '',
  });

  @override
  Widget build(BuildContext context) {
    double _screenSizeHeight = MediaQuery.of(context).size.height / 1.4;
    if (topTitle == '') {
      _screenSizeHeight += 38;
    }

    if (bottomTitle == '') {
      _screenSizeHeight += 38;
    }

    IconButton getPageIconButton() {
      if (dontHasBackButton) {
        return IconButton(
          icon: new Icon(
            Icons.close,
            color: Colors.transparent,
          ),
          color: Colors.transparent,
          onPressed: null,
        );
      } else if (pathCloseButton != '') {
        return IconButton(
          icon: new Icon(Icons.close),
          onPressed: () => Navigator.popUntil(
            context,
            ModalRoute.withName(pathCloseButton),
          ),
        );
      } else {
        return IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        );
      }
    }

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.light // Dark == white status bar -- for IOS.
        ));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: !dontHasBackButton,
        iconTheme: IconThemeData(color: darkColor),
        backgroundColor: Colors.white,
        leading: getPageIconButton(),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          topTitle != ''
              ? Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        topTitle,
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.headline1.fontFamily,
                          fontSize:
                              Theme.of(context).textTheme.headline1.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline1.fontWeight,
                          color: Theme.of(context).textTheme.headline1.color,
                        ),
                      ),
                      bottomTitle != ''
                          ? Text(
                              bottomTitle,
                              style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .fontFamily,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .fontWeight,
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              : Container(),
          Container(
            height: _screenSizeHeight,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  height: _screenSizeHeight,
                  child: body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
