import 'package:baitap/constant/number_format.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:baitap/pages/overview_pages/controller/overview_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/overview_pages/controller/overview_home_controller.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

import '../../../firebase/controller/chitieuthang_controller.dart';

class OverviewHome extends StatelessWidget {
  OverviewHome({Key? key}) : super(key: key);
  final OverviewHomeController controller = Get.put(OverviewHomeController());
  final ChiTieuThangController ctThangController =
      Get.put(ChiTieuThangController());
  final AccountController userController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                balanceBuilder(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Báo cáo chi tiêu tháng',
                    style: AppTextStyle.textStyle3Grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                chartTransactions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget balanceBuilder(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.87,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Số Dư Trong Ví',
              style: AppTextStyle.textStyle3W,
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(() {
              print(ctThangController.tinhSodu());
              return Text(
                (ctThangController.soduconlai.value).toMoneyString(),
             //   (int.parse(userController.userModel.value.sdu) - int.parse(ctThangController.chiTieuThang.value.tongchiphi)).toMoneyString(),
                // NumberFormat.decimalPattern('en_us').format(10000000),
                style: AppTextStyle.textStyle6WBold,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget chartTransactions(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: charts.BarChart(
        controller.series.value,
        animate: true,
      ),
    );
  }
}
