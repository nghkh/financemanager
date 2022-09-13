import 'package:get/get.dart';
import 'package:baitap/constant/data_listview_plan.dart';
import 'package:flutter/material.dart';

class OverviewPlanController extends GetxController {
  List<DataLVPlan> dataListViews = <DataLVPlan>[];
  @override
  void onInit() {
    dataListViews.addAll([
      DataLVPlan(icon: const Icon(Icons.task), title: 'Ngân sách', content: 'Một kế hoạch tài chính giúp cạn cân bằng các khoản thi và khoản chi của mình'),
      DataLVPlan(icon: const Icon(Icons.calendar_month_outlined), title: 'Giao dịch định kì', content: 'Tại ra các giao dịch định kì'),
      DataLVPlan(icon: const Icon(Icons.list), title: 'Hoá đơn', content: 'Theo dõi hoá đơn của bạn như điện, thuê nhà, thuê bao internet,..,'),
    ]);
    // TODO: implement onInit
    super.onInit();
  }
}