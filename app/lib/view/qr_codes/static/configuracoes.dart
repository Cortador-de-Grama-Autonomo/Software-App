import 'package:app/routes/app_routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/widgets/main_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Configuracao extends StatefulWidget {
  final String altura;
  final Map<String, String> dados;

  Configuracao({Key key, this.altura, this.dados})
      : super(key: key);
       @override
  _ConfiguracaoState createState() => _ConfiguracaoState();
}
  class _ConfiguracaoState extends State<Configuracao> {
  initState() {
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        Card(
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
                    'Cortador de Jardim',
                    style: Theme.of(context).textTheme.headline4.copyWith(color: primaryColor)
                  ),
                  SizedBox(height: 24),
                  
                  Text(
                      'Agendamento: ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.w600, color: darkColor),
                    ),
                  SizedBox(height: 16),

                  Text(
                    '    Data:  30 de Outubro de 2021',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:darkColor)
                  ),

                  SizedBox(height: 16),

                   Text(
                    '    Hora:  13:00',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:darkColor)
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Corte:',
                    style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.w600, color: darkColor),
                  ),
          
                  SizedBox(height: 16),

                  Text(widget.altura != null ? widget.altura : '   2 cm',
                    style: Theme.of(context).textTheme.headline3.copyWith(color:darkColor)
                  ),
          
                  SizedBox(height: 16),
                  
                ],
              ),
            ),
          ],
        ),
      ),
        SizedBox(height: 16),


        MainTile(
          title: 'Corte',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.CORTE);
          },
        ),
        MainTile(
          title: 'Agendar Horário',
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.AGENDAR);
          },
        ),
      ],
    );

    return BaseScreen(
      topTitle: "Configurações",
      bottomTitle: "",
      body: body,
    );
  }
}
