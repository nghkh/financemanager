import 'package:baitap/pages/overview_pages/tab_overview/overview_account.dart';
import 'package:baitap/pages/overview_pages/tab_overview/overview_home.dart';
import 'package:baitap/pages/overview_pages/tab_overview/overview_plan.dart';
import 'package:baitap/pages/overview_pages/tab_overview/overview_wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabAppController extends GetxController {
  static TabAppController get to => Get.find();
  var currentIndex = 0.obs;
  final pages = <String>['/overview', '/wallet', '/plan', '/account'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/overview') {
      return GetPageRoute(
        settings: settings,
        page: () => const OverviewHome(),
      );
    } else if (settings.name == '/wallet') {
      return GetPageRoute(
        settings: settings,
        page: () => const OverviewWallet(),
        binding: TabBinding(),
      );
    } else if (settings.name == '/plan'){
      return GetPageRoute(
        settings: settings,
        page: () => const OverViewSum(),

      );
    } else if (settings.name == '/account'){
      return GetPageRoute(
        settings: settings,
        page: () => const OverviewAccount(),
      );
    }
    return null;
  }
}

class TabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabAppController());
    // TODO: implement dependencies
  }
}