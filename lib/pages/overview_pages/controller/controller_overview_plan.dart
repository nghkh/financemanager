import 'package:get/get.dart';
import 'package:baitap/model/data_listview_plan.dart';
import 'package:flutter/material.dart';

class OverviewPlanController extends GetxController {
  List<DataLVPlan> dataListViews = <DataLVPlan>[];

  @override
  void onInit() {
    dataListViews.addAll([
      DataLVPlan(
          icon: const Icon(Icons.task),
          title: 'Ngân sách',
          content:
              'Một kế hoạch tài chính giúp cạn cân bằng các khoản thi và khoản chi của mình',
          onTap: () {
            Get.snackbar('Rất thông cảm', 'Tính năng đang trong quá trình phát triển, sẽ cập nhật trong các phiên bản sắp tới');
          }),
      DataLVPlan(
          icon: const Icon(Icons.calendar_month_outlined),
          title: 'Giao dịch định kì',
          content: 'Tạo ra các giao dịch định kì',
          onTap: () {
            Get.snackbar('Rất thông cảm', 'Tính năng đang trong quá trình phát triển, sẽ cập nhật trong các phiên bản sắp tới');
          }),
      DataLVPlan(
          icon: const Icon(Icons.list),
          title: 'Hoá đơn',
          content:
              'Theo dõi hoá đơn của bạn như điện, thuê nhà, thuê bao internet,..,',
          onTap: () {
            Get.snackbar('Rất thông cảm', 'Tính năng đang trong quá trình phát triển, sẽ cập nhật trong các phiên bản sắp tới');
          }),
    ]);
    // TODO: implement onInit
    super.onInit();
  }
}

class PlanBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(()=>OverviewPlanController());
    // TODO: implement dependencies
  }

}

