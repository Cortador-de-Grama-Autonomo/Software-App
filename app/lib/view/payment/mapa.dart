import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/view/payment/confirm_payment/payment.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/otherbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';



class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  initState() {
    super.initState();
  }

  Function onPressed;



  Container bola(){
    return  Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Column renderCPfCnpj() {
    return Column(
      children: [
            Container(
          child:  Card(
        elevation: 3,
        color: lightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Praça Norte',
                    style: Theme.of(context).textTheme.headline3.copyWith(color: darkColor)
                  ),
          
                  SizedBox(height: 16),
                ],
              ),
            ),
            
          ],
        ),

      ),
    ),
        Container(
          child: RaisedButton( 
            color: lightColor,
          child:  Card(
        elevation: 3,
        color: lightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gramado FGA',
                    style: Theme.of(context).textTheme.headline3.copyWith(color: darkColor)
                  ),
                 
          
                  SizedBox(height: 16),
                ],
              ),
            ),

          
          ],
        ),
      ),
      onPressed: () {
      }
      ),
    ),

    SizedBox(height: 16),

     Button(
          title: "Adicionar Área",
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.ADD_AREA);
        }
      ),

      ButtonOther(
          title: "Selecionar",
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
        }
      ),
 
    


      
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              renderCPfCnpj(),

            ],
          ),
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Mapeamento",
      body: body,
    );
  }
}
