import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}

class WalletBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    // TODO: implement dependencies
  }
}