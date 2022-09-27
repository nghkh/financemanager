import 'package:flutter/material.dart';

class DataLVPlan {
  final Widget icon;
  final String title;
  final String content;
  final Function() onTap;

  DataLVPlan({
    required this.icon,
    required this.title,
    required this.content,
    required this.onTap,
  });
}
