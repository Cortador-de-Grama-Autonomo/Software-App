import 'package:app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class GeneralTile extends StatefulWidget {
  final Map<String, Object> elementData;
  final dynamic elementObj;
  final Map<String, String> actionsList;
  Function callback;

  GeneralTile(
      {Key key,
      this.elementData,
      this.elementObj,
      this.actionsList,
      this.callback})
      : super(key: key);

  @override
  _GeneralTileState createState() {
    return _GeneralTileState();
  }
}

class _GeneralTileState extends State<GeneralTile> {
  final api = new Api();

  @override
  Widget build(BuildContext context) {
    final title = widget.elementData['title'];
    final subtitle = widget.elementData['subtitle'];
    final id = widget.elementData['id'];
    final element = widget.elementObj;
    final actionsList = widget.actionsList;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 85,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(60, 0, 0, 0),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline2.fontFamily,
            fontSize: Theme.of(context).textTheme.headline2.fontSize,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        subtitle: Text(
          "R\$ $subtitle",
          style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline3.fontFamily,
              fontSize: Theme.of(context).textTheme.headline3.fontSize,
              color: Theme.of(context).primaryColor),
        ),
        trailing: PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryColor,
            size: 32,
          ),
          onSelected: (value) => {
            setState(() {
              if (value == "Visualizar") {
                Navigator.of(context)
                    .pushNamed(actionsList['Visualize'], arguments: element);
              } else if (value == "Editar") {
                Navigator.of(context)
                    .pushNamed(actionsList['Edit'], arguments: element);
              } else if (value == "Deletar") {
                alertDelete(
                    context, actionsList['Delete'], title, id, widget.callback);
              }
            })
          },
          itemBuilder: (BuildContext context) {
            return ["Visualizar", "Editar", "Deletar"].map((String testString) {
              return PopupMenuItem(
                value: testString,
                child: Text(
                  testString,
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Future<void> alertDelete(BuildContext context, String deletePath,
      String elementTitle, int elementID, Function callbackMine) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Deletar',
            style:
                new TextStyle(fontWeight: FontWeight.normal, color: Colors.red),
          ),
          content: Text(
            'Deseja mesmo deletar ' + elementTitle,
            style: new TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Confirmar'),
              onPressed: () async {
                try {
                  await api.delete(route: deletePath + elementID.toString());
                  callbackMine();
                  Navigator.of(context).pop();
                } catch (e) {
                  throw Exception('Failed to delete element From Server');
                }
              },
            ),
          ],
        );
      },
    );
  }
}
