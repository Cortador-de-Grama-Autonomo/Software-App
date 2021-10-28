import 'package:app/theme/colors.dart';
import 'package:app/widgets/base_screen.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/button.dart';
import 'package:app/controller/key_adressing.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';



class AddArea extends StatefulWidget {
  @override
  _AddAreaState createState() => _AddAreaState();
}

class _AddAreaState extends State<AddArea> {
  initState() {
    super.initState();
  }

  bool _isButtonAvaible = false;
  final _nicknameController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            children: [
              
              Card(
              color: lightColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _nicknameController,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Nome do Local',
                      border: OutlineInputBorder(),
                      hintText: 'Ex.: Gramado Central'),
                ),
              
              ),
              SizedBox(height: 16),

               Container(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 300,
                    alignment: Alignment.center,
                    child: FlutterMap(
                    options: MapOptions(

                      // Coordenada central do mapa.
                        center: LatLng(-15.799862, -47.864195),
                        // Quantidade de zoom do mapa.
                        zoom: 17),
                    layers: [
                      // Url do mapa.
                      TileLayerOptions(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
              ],
            ),
            ),
            SizedBox(height: 16),

            ],
              ),
              
            ),
            ],
          ),
        ),
        Button(
          title: "Salvar",
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.MAPA);
        }
      ),
      ],
    );

    return BaseScreen(
      topTitle: "Cortador",
      body: body,
    );
  }
}
