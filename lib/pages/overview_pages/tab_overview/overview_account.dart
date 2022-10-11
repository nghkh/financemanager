import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/container_for_profile.dart';
import 'package:baitap/Widget/profile_pic.dart';
import 'package:baitap/model/users.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewAccount extends StatelessWidget {
  const OverviewAccount({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
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
              Column(
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
                    text2: userModel.firstName,
                  ),
                  GetContainerForProfile(
                    text1: 'last name',
                    text2: userModel.lastName,
                  ),
                  GetContainerForProfile(
                    text1: 'gender',
                    text2: userModel.gender,
                  ),
                  GetContainerForProfile(
                    text1: 'Date of birth',
                    text2: userModel.dob,
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
                    text2: userModel.sdt,
                  ),
                  GetContainerForProfile(
                    text1: 'Email',
                    text2: userModel.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    onPressed: () => Get.find<AppAuthController>().signOut(),
                    text: 'Đăng xuất',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
