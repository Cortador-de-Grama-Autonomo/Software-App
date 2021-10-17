import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final String placeholder;
  final String initialValue;

  DropDown({this.items, this.onChanged, this.placeholder, this.initialValue});
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue;

  @override
  initState() {
    super.initState();
    if (widget.initialValue != null) {
      dropdownValue = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: Colors.white,
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 40,
        style: TextStyle(color: Colors.black),
        hint: Text(widget.placeholder),
        underline: Container(
          height: 0,
          color: Colors.grey,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          widget.onChanged(newValue);
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}
