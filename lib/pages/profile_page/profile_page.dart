import 'package:baitap/Widget/container_for_profile.dart';
import 'package:baitap/Widget/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                        'Basic Infomation',
                        style: AppTextStyle.textStyle5Black,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to('/profile_basicInfo');
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
                    text1: 'System ID member',
                    text2: '123456789',
                  ),
                  const GetContainerForProfile(
                    text1: 'ID member',
                    text2: 'user name',
                  ),
                  const GetContainerForProfile(text1: 'gender', text2: 'Male',),
                  const GetContainerForProfile(
                    text1: 'Martial Status',
                    text2: 'Single',
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
                        'contact infomation',
                        style: AppTextStyle.textStyle5Black,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to('/profile_contactInfo');
                        },
                      ),
                    ],
                  ),
                  const GetContainerForProfile(
                    text1: 'Mobile phone 1',
                    text2: '0123456789',
                  ),
                  const GetContainerForProfile(
                    text1: 'Mobile phone 2',
                    text2: '0123456789',
                  ),
                  const GetContainerForProfile(
                    text1: 'Email',
                    text2: 'johndoe@gmail.com',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Next of kin',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to('/nextOfKin');
                        },
                      ),
                    ],
                  ),
                  const GetContainerForProfile(
                    text1: 'Name',
                    text2: 'Jane Doe',
                  ),
                  const GetContainerForProfile(
                    text1: 'Relationship',
                    text2: 'Wife',
                  ),
                  const GetContainerForProfile(
                    text1: 'Mobile phone',
                    text2: '0123456789',
                  ),
                  const GetContainerForProfile(
                      text1: 'Email', text2: 'johndoe@gmail.com'),
                  const GetContainerForProfile(
                    text1: 'postal address',
                    text2: '',
                  ),
                  const GetContainerForProfile(
                    text1: 'physical Address',
                    text2: '123 abc street',
                  ),
                  const SizedBox(
                    height: 20,
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
