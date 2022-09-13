import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:baitap/model/controller_overview_plan.dart';
import 'package:get/get.dart';

class OverViewSum extends StatelessWidget {
  const OverViewSum({Key? key}) : super(key: key);

  OverviewPlanController get controller => Get.put(OverviewPlanController());

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        Text(
          'Lập kế hoạch',
          style: AppTextStyle.textStyle1,
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget buildBody() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              controller.dataListViews[index].icon,
              Column(
                children: [
                  Text(
                    controller.dataListViews[index].title,
                    style: AppTextStyle.textStyle2Green,
                  ),
                  Text(
                    controller.dataListViews[index].content,
                    style: AppTextStyle.textStyle3,
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
        itemCount: controller.dataListViews.length);
  }
}
