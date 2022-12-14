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
              icon: const Icon(Icons.done),
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
                  const ProfilePic(),
                  const SizedBox(height: 20),
                  AppTextField(
                    hintText: 'Nh???p h???',
                    labelText: 'H???',
                    controller: Get.find<NameProfileController>().firstName,
                  ),
                  AppTextField(
                    hintText: 'Nh???p t??n ?????m v?? t??n',
                    labelText: 'T??n ?????m v?? t??n',
                    controller: Get.find<NameProfileController>().lastName,
                  ),
                  AppTextField(
                    hintText: 'Nh???p s??? d?? t??i kho???n',
                    labelText: 'S??? d?? t??i kho???n',
                    controller: Get.find<NameProfileController>().fillBalance,
                  ),
                  AppTextField(
                    hintText: 'Nh???p email',
                    labelText: 'Email',
                    controller: Get.find<NameProfileController>().fillEmail,
                  ),
                  AppTextField(
                    hintText: 'Nh???p s??? ??i???n tho???i',
                    labelText: 'S??? ??i???n tho???i',
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
                  const SizedBox(height: 20),
                  const Text('Ng??y sinh'),
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
