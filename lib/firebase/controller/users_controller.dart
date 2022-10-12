import 'package:baitap/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'firebase_constant.dart';

class userController extends GetxController {
  final allUser = <UserModel>[].obs;
  late UserModel userModel;

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
          await firestore.collection('users').get();
      final userList =
          querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      allUser.assignAll(userList);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setUser(UserModel userModel) async {
    try {
      await firestore.collection('users').doc(userModel.id).set({
        'email': userModel.email,
        'sdu': userModel.sdu,
        'firstname': userModel.firstName,
        'lastname': userModel.lastName,
        'sdt': userModel.sdt,
        'dob': userModel.dob,
        'gender': userModel.gender,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUser(UserModel userModel) async {
    try {
      await firestore.collection('users').doc(userModel.id).delete();

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

  Future<void> updateUser(UserModel userModel) async {
    try {
      await firestore.collection('users').doc().update({
        'email': userModel.email,
        'sdu': userModel.sdu,
        'firstname': userModel.firstName,
        'lastname': userModel.lastName,
        'sdt': userModel.sdt,
        'dob': userModel.dob,
      });
    } catch (e) {
      print(e);
    }
  }
}
