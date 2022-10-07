import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/firebase/controller/chitieuthang_controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/model/chi_tieu.dart';
import 'package:baitap/model/chi_tieu_thang.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
  }
}
// ever(firebaseUser, _setInitialScreen);

// _setInitialScreen(User? user) {
//   if (user != null) {
//     // user is logged in
//     Get.offAll(() => const SignUpPage());
//   } else {
//     // user is null as in user is not available or not logged in
//     Get.to(() => LoginPage());
//   }
// }

void signOut() {
  try {
    auth.signOut();
  } catch (e) {
    print(e.toString());
  }
}

//Controller cho man addtransaction
class addTransactionController extends GetxController {
  final allchiTieu = <ChiTieu>[].obs;

  @override
  void onReady() {
    set(chiphi.value, loai.value);
    super.onReady();
  }

  late RxString chiphi = ''.obs;
  late RxString loai = ''.obs;
  late ChiTieu chiTieuModel;
  late ChiTieuThang chiTieuThangmodel;
  Future<void> set(chiphi, loai) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      ChiTieuController chiTieuController = ChiTieuController();
      // ChiTieuThangController _chiTieuThangController =
      //     Get.put(ChiTieuThangController());
      String iduser = auth.currentUser!.uid;
      final id = '${chiTieuController.allchiTieu.length + 1}';
      try {
        await chiTieuController.setChiTieu(
          ChiTieu(
              id: '1',
              iduser: '2',
              idthang: chiTieuModel.timetoMonth(),
              loai: loai.toString(),
              chiphi: chiphi.toString(),
              ngaythang: chiTieuModel.timetoDay()),
        );
      } catch (e) {
        print(e);
      }
      //tongchiphi= tong chitieu trong thang
      // var tong = 0;
      // String tongchiphi = _chiTieuController.allchiTieu
      //     .where((element) => element.iduser == iduser)
      //     .where((element) => element.idthang == chiTieuModel.timetoMonth())
      //     .map((e) => {tong + int.parse(e.chiphi)})
      //     .toString();
      // _chiTieuThangController.setChiTieuThang(ChiTieuThang(
      //     tongchiphi: tongchiphi,
      //     thang: chiTieuModel.timetoMonth(),
      //     id: '$iduser${chiTieuModel.timetoMonth()}',
      //     iduser: iduser));
      // print(tongchiphi);
    } catch (e) {
      print(e);
    }
  }
}
