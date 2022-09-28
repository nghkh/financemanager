
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "USA", child: Text("USA")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownGender {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "male", child: Text("male")),
    const DropdownMenuItem(value: "female", child: Text("female")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownMarial {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
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
        title: const Text("Dropdown Button"),
      ),
      body: Center(
        child: GetDropDown(items: dropdownGender, hint: "Select gender"),
      ),
    ),
  ));
}

class GetDropDown extends StatefulWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? hint;

  final Function(String)? onChanged;

  const GetDropDown({
    Key? key,
    this.items,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  @override
  _GetDropDownState createState() => _GetDropDownState();
}

class _GetDropDownState extends State<GetDropDown> {
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
