import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabController extends GetxController {
  static TabController get to => Get.find();
  var currentIndex = 0.obs;
  final pages = <String>['/overview', '/wallet', '/plan', '/account'];

  void changeTab(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/overview') {
      return GetPageRoute(
      settings: settings,
      page: () => Overview(),

    );
    }
    if (settings.name == '/overview') return GetPageRoute();
    if (settings.name == '/overview') return GetPageRoute();
    if (settings.name == '/overview') return GetPageRoute();
    return null;
  }
}
