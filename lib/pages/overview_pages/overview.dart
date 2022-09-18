import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/overview_pages/controller/tab_controller.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  TabAppController get controller => Get.find<TabAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/overview',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Tổng quan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Chi tiêu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Kế hoacch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.grey,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
