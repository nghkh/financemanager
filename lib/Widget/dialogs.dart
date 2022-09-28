
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
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                textAlign: TextAlign.center,
              ),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
