import 'package:baitap/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'firebase_constant.dart';

class userController extends GetxController {
  final allUser = <User>[].obs;
  late User userModel;
  @override
  void onReady() {
    addUser();
    setUser(userModel);
    deleteUser(userModel);
    updateUser(userModel);
    super.onReady();
  }

  Future<void> addUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('Users').get();
      final userList =
          querySnapshot.docs.map((e) => User.fromSnapshot(e)).toList();
      print('userList: $userList');
      allUser.assignAll(userList);
      ;
    } catch (e) {
      print(e);
    }
  }

  Future<void> setUser(User userModel) async {
    try {
      await firestore.collection('Users').doc(userModel.id).set({
        'email': userModel.email,
      });
      print('abcxyz');
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUser(User userModel) async {
    try {
      await firestore.collection('Users').doc(userModel.id).delete();
      print('abcxyz');
      //xóa chi tiêu có cùng iduser= iduser của user vừa xóa
      await firestore
          .collection('ChiTieuThang')
          .where('iduser', isEqualTo: userModel.id)
          .get()
          .then((value) => {
                for (DocumentSnapshot ds in value.docs) {ds.reference.delete()}
              });
      await firestore
          .collection('ChiTieu')
          .where('iduser', isEqualTo: userModel.id)
          .get()
          .then((value) => {
                for (DocumentSnapshot ds in value.docs) {ds.reference.delete()}
              });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUser(User userModel) async {
    try {
      await firestore.collection('Users').doc(userModel.id).update({
        'email': userModel.email,
      });
      print('abcxyz');
    } catch (e) {
      print(e);
    }
  }
}
