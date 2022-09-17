import 'package:get/get.dart';

class TabController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index;
  }

  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}