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
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.87,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Container(
                decoration: BoxDecoration(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
