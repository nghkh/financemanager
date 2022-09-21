import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  const AppTextStyle._();

  static const TextStyle textStyle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle textStyle2 = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle textStyle2Green = TextStyle(
    fontSize: 16,
    color: Colors.green,
  );

  static const TextStyle textStyle3 = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
  static const TextStyle textStyle3Grey = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
  static const TextStyle textStyle3bold = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle3Wbold = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
