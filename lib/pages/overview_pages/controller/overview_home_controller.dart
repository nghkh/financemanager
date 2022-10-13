import 'package:baitap/firebase/controller/chitieuthang_controller.dart';
import 'package:baitap/model/chi_tieu_thang.dart';
import 'package:baitap/pages/overview_pages/controller/overview_account_controller.dart';
import 'package:get/get.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../../../model/chart.dart';

class OverviewHomeController extends GetxController {
  var dataChart = <ChartApp>[].obs;
  var series = <charts.Series<ChartApp, String>>[].obs;
  // AccountController controller = Get.put(AccountController());
  ChiTieuThangController controller = Get.put(ChiTieuThangController());
  @override
  void onInit() {
    dataChart.addAll([
      ChartApp('Tháng trước', 0),
      ChartApp('Tháng này', int.parse(controller.chiTieuThang.value.tongchiphi)),
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