import 'package:baitap/Widget/container_for_profile.dart';
import 'package:baitap/Widget/profile_pic.dart';
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
                  const GetContainerForProfile(
                    text1: 'first name',
                    text2: 'John',
                  ),
                  const GetContainerForProfile(
                    text1: 'last name',
                    text2: 'Doe',
                  ),
                  const GetContainerForProfile(
                    text1: 'gender',
                    text2: 'Male',
                  ),
                  const GetContainerForProfile(
                    text1: 'Date of birth',
                    text2: '01/01/2000',
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
                  const GetContainerForProfile(
                    text1: 'Mobile phone 1',
                    text2: '0123456789',
                  ),
                  const GetContainerForProfile(
                    text1: 'Email',
                    text2: 'johndoe@gmail.com',
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
