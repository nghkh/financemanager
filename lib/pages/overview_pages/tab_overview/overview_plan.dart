import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:baitap/pages/overview_pages/controller/controller_overview_plan.dart';
import 'package:get/get.dart';

class OverViewSum extends StatelessWidget {
  const OverViewSum({Key? key}) : super(key: key);

  OverviewPlanController get controller => Get.put(OverviewPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
      shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              controller.dataListViews[index].icon,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              IconButton(
                icon: Icon(
                  Icons.forward,
                  size: 14,
                ),
                onPressed: controller.dataListViews[index].onTap,
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
