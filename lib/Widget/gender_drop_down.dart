
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "USA", child: Text("USA")),
    DropdownMenuItem(value: "Canada", child: Text("Canada")),
    DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownGender {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "male", child: Text("male")),
    DropdownMenuItem(value: "female", child: Text("female")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownMarial {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      value: "???",
      child: Text("???"),
    )
  ];
  return menuItems;
}

void main() {
  runApp(MaterialApp(
    title: "Dropdown Button",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Button"),
      ),
      body: Center(
        child: getDropDown(items: dropdownGender, hint: "Select gender"),
      ),
    ),
  ));
}

class getDropDown extends StatefulWidget {
  @override
  final List<DropdownMenuItem<String>>? items;
  final String? hint;

  final Function(String)? onChanged;

  const getDropDown({
    Key? key,
    this.items,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  _getDropDownState createState() => _getDropDownState();
}

class _getDropDownState extends State<getDropDown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: widget.items ?? dropdownItems,
      value: _selectedValue,
      onChanged: (value) {
        widget.onChanged;
        setState(() {
          _selectedValue = value.toString();
        });
      },
      isExpanded: true,
      borderRadius: BorderRadius.circular(10),
      underline: Container(
        height: 0,
      ),
      hint: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${widget.hint}"),
      ),
    );
  }
}
