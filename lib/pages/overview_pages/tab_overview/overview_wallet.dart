import 'package:baitap/constant/text_style.dart';
import 'package:baitap/pages/overview_pages/controller/wallet_controller.dart';
import 'package:baitap/pages/overview_pages/tab_wallet/pev_month.dart';
import 'package:baitap/pages/overview_pages/tab_wallet/this_month_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewWallet extends StatelessWidget {
  const OverviewWallet({Key? key}) : super(key: key);

  WalletController get controller => Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Column(
            children: [
              Text(
                'Số dư',
                style: AppTextStyle.textStyle3Grey,
              ),
              Text(
                '100000 VNĐ',
                style: AppTextStyle.textStyle1,
              ),
            ],
          ),
        ),
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(
              text: 'Tháng trước',
            ),
            Tab(
              text: 'Tháng này',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          PreviousMonth(),
          ThisMonth(),
        ],
      ),
    );
  }
}
