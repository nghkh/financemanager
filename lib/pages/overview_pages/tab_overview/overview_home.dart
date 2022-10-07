import 'package:baitap/Widget/button.dart';
import 'package:baitap/pages/overview_pages/controller/overview_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:get/get.dart';

class OverviewHome extends StatelessWidget {
  const OverviewHome({Key? key}) : super(key: key);

  OverviewHomeController get controller => Get.put(OverviewHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height *0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Obx(() {
                    return charts.BarChart(
                      controller.series.value,
                      animate: true,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
