import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/pages/overview_pages/tab_wallet/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThisMonth extends StatelessWidget {
  ThisMonth({Key? key}) : super(key: key);
  final TabWalletController tabController = Get.put(TabWalletController());
  final ChiTieuController ctController = Get.put(ChiTieuController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        tabController.kindsofSpending(
                            ctController.spendingListonMonth.value[index].loai),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ctController
                                .spendingListonMonth.value[index].ngaythang),
                            Text(ctController
                                .spendingListonMonth.value[index].chiphi),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12,
                );
              },
              itemCount: ctController.spendingListonMonth.value.length,
            ),
          ),
        ),
      ),
    );
  }
}
