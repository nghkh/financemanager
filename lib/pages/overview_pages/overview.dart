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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Obx(
              () => BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: 'Tổng quan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.wallet,
                    ),
                    label: 'Chi tiêu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.task,
                    ),
                    label: 'Kế hoạch',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.manage_accounts,
                    ),
                    label: 'Tài khoản',
                  ),
                ],
                currentIndex: controller.currentIndex.value,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.green,
                onTap: controller.changePage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
