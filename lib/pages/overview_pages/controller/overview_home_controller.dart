import 'package:get/get.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../../../model/chart.dart';

class OverviewHomeController extends GetxController {
  var dataChart = <ChartApp>[].obs;
  var series = <charts.Series<ChartApp, String>>[].obs;
  @override
  void onInit() {
    dataChart.addAll([
      ChartApp('Tháng trước', 12000000),
      ChartApp('Tháng này', 1200000),
    ]);

    series.value = [
      charts.Series(
        id: "financial",
        data: dataChart.value,
        domainFn: (ChartApp series, _) => series.timestamps,
        measureFn: (ChartApp series, _) => series.spendingData,
        colorFn: (ChartApp series, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];

    // TODO: implement onInit
    super.onInit();
  }
}