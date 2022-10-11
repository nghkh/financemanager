import 'package:baitap/Widget/date_picker.dart';
import 'package:baitap/Widget/gender_drop_down.dart';
import 'package:baitap/Widget/profile_pic.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:baitap/model/users.dart';
import 'package:baitap/pages/profile_page/controller/update_profile_user_controller.dart';
import 'package:baitap/pages/transcations_page/controller/transcation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await Get.find<UserController>().setUser(UserModel(
                  id: auth.currentUser!.uid,
                  email: Get.find<NameProfileController>().fillEmail.text,
                  sdu: Get.find<NameProfileController>().fillBalance.text,
                  firstName: Get.find<NameProfileController>().firstName.text,
                  lastName: Get.find<NameProfileController>().lastName.text,
                  gender: Get.find<NameProfileController>().selectedValue.value,
                  sdt: Get.find<NameProfileController>().fillPhone.text,
                  dob: Get.find<TranscationsPageController>()
                      .selectedDate
                      .value
                      .toString(),
                ));
                Get.back();
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Obx(
              () => Column(
                children: [
                  ProfilePic(),
                  SizedBox(height: 20),
                  AppTextField(
                    hintText: 'Nhập họ',
                    labelText: 'Họ',
                    controller: Get.find<NameProfileController>().firstName,
                  ),
                  AppTextField(
                    hintText: 'Nhập tên đệm và tên',
                    labelText: 'Tên đệm và tên',
                    controller: Get.find<NameProfileController>().lastName,
                  ),
                  AppTextField(
                    hintText: 'Nhập số dư tài khoản',
                    labelText: 'Số dư tài khoản',
                    controller: Get.find<NameProfileController>().fillBalance,
                  ),
                  AppTextField(
                    hintText: 'Nhập email',
                    labelText: 'Email',
                    controller: Get.find<NameProfileController>().fillEmail,
                  ),
                  AppTextField(
                    hintText: 'Nhập số điện thoại',
                    labelText: 'Số điện thoại',
                    controller: Get.find<NameProfileController>().fillPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppDropDown(
                        items:
                            Get.find<NameProfileController>().listGenders.value,
                        value: Get.find<NameProfileController>()
                            .selectedValue
                            .value,
                        onChanged: (value) =>
                            Get.find<NameProfileController>().onChanged(value),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Ngày sinh'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AppDatePicker(
                      onPressed: () {
                        Get.find<TranscationsPageController>().chooseDate();
                      },
                      selectedDate: Get.find<TranscationsPageController>()
                          .selectedDate
                          .value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
