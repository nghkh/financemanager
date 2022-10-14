import 'package:baitap/constant/number_format.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/firebase/controller/chitieuthang_controller.dart';
import 'package:baitap/pages/overview_pages/controller/wallet_controller.dart';
import 'package:baitap/pages/overview_pages/tab_wallet/pev_month.dart';
import 'package:baitap/pages/overview_pages/tab_wallet/this_month_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewWallet extends StatelessWidget {
  const OverviewWallet({Key? key}) : super(key: key);

  WalletController get controller => Get.find<WalletController>();
  ChiTieuThangController get ctThangController =>
  Get.put(ChiTieuThangController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Column(
              children: [
                const Text(
                  'Số dư',
                  style: AppTextStyle.textStyle3WBold,
                ),
                Text(
                  '${(ctThangController.soduconlai.value).toMoneyString()} VNĐ ',
                  style: AppTextStyle.textStyle1,
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: const [
              Tab(
                text: 'Tháng này',
              ),
              Tab(
                text: 'Tháng trước',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            ThisMonth(),
            PreviousMonth(),
          ],
        ),
      ),
    );
  }
}
