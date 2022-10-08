import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RxUserModel {
  final id = 0.obs;
  final name = 'uid'.obs;
}

class UserModel {
  UserModel({id, name});

  final rx = RxUserModel();

  get name => rx.name.value;
  set name(value) => rx.name.value = value;

  get id => rx.id.value;
  set id(value) => rx.id.value = value;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'name' : name, 'id':id,
  };
}


class NameProfileController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();



}

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NameProfileController>(() => NameProfileController());
    // TODO: implement dependencies
  }

}