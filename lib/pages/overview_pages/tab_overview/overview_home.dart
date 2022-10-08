import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/overview_pages/controller/overview_home_controller';
import 'package:charts_flutter_new/flutter.dart' as charts;

class OverviewHome extends StatelessWidget {
  OverviewHome({Key? key}) : super(key: key);
  OverViewHomeController controller = Get.put(OverViewHomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 220, 220, 220),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            child: charts.BarChart(
              controller.series.value,
              animate: true,
            ),
          ),
        ),
      ),
    );
  }
}
