import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/chi_tieu.dart';

class WalletController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}

class ShowTransactionsController extends GetxController {
  final listTransactions = <ChiTieu>[].obs;

}


class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    // TODO: implement dependencies
  }
}