import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SpendingDataDay {
  final Timestamp? dateSpending;
  final int? iconKindSpending;
  final int? moneySpending;

  SpendingDataDay(this.dateSpending, this.iconKindSpending, this.moneySpending);
}
