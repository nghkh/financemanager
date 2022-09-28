
import 'package:flutter/material.dart';


class AppDialog extends StatelessWidget {
  final Widget? icon;
  final String headingText;
  final String contentText;
  final Widget action;

  const AppDialog({
    Key? key,
    required this.headingText,
    this.icon,
    required this.contentText,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Container(
            child: icon,
          ),
          Text(
            headingText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            contentText,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          action,
        ],
      ),
    );
  }
}
