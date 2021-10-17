import 'package:form_validator/form_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final Function(String) validator;
  final DateTime initalValue;

  AdaptativeDatePicker({this.onDateChanged, this.validator, this.initalValue});

  @override
  _AdaptativeDatePickerState createState() => _AdaptativeDatePickerState();
}

class _AdaptativeDatePickerState extends State<AdaptativeDatePicker> {
  TextEditingController dateController = new TextEditingController();

  @override
  initState() {
    super.initState();
    if (widget.initalValue != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(widget.initalValue);
    }
  }

  _showDatePicker(BuildContext context) async {
    var date = DateTime.now();

    DateTime dt = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: new DateTime(date.year, date.month, date.day + 15));
    if (dt == null) {
      return;
    }
    this.setState(() {
      dateController.text = DateFormat('dd/MM/yyyy').format(dt);
    });

    widget.onDateChanged(dt);
  }

  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).primaryColorDark,
      ),
      decoration: InputDecoration(
        labelText: 'Data de vencimento',
        border: OutlineInputBorder(),
      ),
      controller: dateController,
      onTap: () => _showDatePicker(context),
      validator: widget.validator,
    );
  }
}
