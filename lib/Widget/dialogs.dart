import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog extends StatelessWidget {
  final Widget? icon;
  final String headingText;

  const AppDialog({Key? key, required this.headingText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      title: Text(
        headingText,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
