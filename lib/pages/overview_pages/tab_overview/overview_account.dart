import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/container_for_profile.dart';
import 'package:baitap/Widget/profile_pic.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:baitap/model/users.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/overview_pages/controller/overview_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewAccount extends StatelessWidget {
  const OverviewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  const ProfilePic(),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Thông tin cơ bản',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Get.toNamed('/profile_info');
                              },
                            ),
                          ],
                        ),
                        GetContainerForProfile(
                          text1: 'first name',
                          text2: Get.find<AccountController>().userModel.value.firstName,
                        ),
                        GetContainerForProfile(
                          text1: 'last name',
                          text2: Get.find<AccountController>().userModel.value.lastName,
                        ),
                        GetContainerForProfile(
                          text1: 'gender',
                          text2: Get.find<AccountController>().userModel.value.gender,
                        ),
                        GetContainerForProfile(
                          text1: 'Date of birth',
                          text2: Get.find<AccountController>().userModel.value.dob,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Thông tin liên lạc',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Get.toNamed('/profile_info');
                              },
                            ),
                          ],
                        ),
                        GetContainerForProfile(
                          text1: 'Mobile phone 1',
                          text2: Get.find<AccountController>().userModel.value.sdt,
                        ),
                        GetContainerForProfile(
                          text1: 'Email',
                          text2: Get.find<AccountController>().userModel.value.email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppButton(
                          onPressed: () =>
                              Get.find<AppAuthController>()
                                  .signOut(),
                          text: 'Đăng xuất',
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
