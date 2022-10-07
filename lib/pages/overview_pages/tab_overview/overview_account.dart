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
              ProfilePic(),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'basic infomation',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.toNamed('/profile_info');
                        },
                      ),
                    ],
                  ),
                  GetContainerForProfile(
                    text1: 'first name',
                    text2: 'John',
                  ),
                  GetContainerForProfile(
                    text1: 'last name',
                    text2: 'Doe',
                  ),
                  GetContainerForProfile(
                    text1: 'System ID member',
                    text2: '123456789',
                  ),
                  GetContainerForProfile(
                    text1: 'ID member',
                    text2: 'user name',
                  ),
                  GetContainerForProfile(text1: 'gender', text2: 'Male'),
                  GetContainerForProfile(
                    text1: 'Martial Status',
                    text2: 'Single',
                  ),
                  GetContainerForProfile(
                    text1: 'Date of birth',
                    text2: '01/01/2000',
                  ),
                  GetContainerForProfile(
                    text1: 'Join date',
                    text2: '10/10/2020',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'contact infomation',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.toNamed('/profile_info');
                        },
                      ),
                    ],
                  ),
                  GetContainerForProfile(
                    text1: 'Mobile phone 1',
                    text2: '0123456789',
                  ),
                  GetContainerForProfile(
                    text1: 'Mobile phone 2',
                    text2: '0123456789',
                  ),
                  GetContainerForProfile(
                    text1: 'Email',
                    text2: 'johndoe@gmail.com',
                  ),
                  GetContainerForProfile(
                    text1: 'Address',
                    text2: '123 abc street',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Next of kin',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.toNamed('/profile_info');
                        },
                      ),
                    ],
                  ),
                  GetContainerForProfile(
                    text1: 'Name',
                    text2: 'Jane Doe',
                  ),
                  GetContainerForProfile(
                    text1: 'Relationship',
                    text2: 'Wife',
                  ),
                  GetContainerForProfile(
                    text1: 'Mobile phone',
                    text2: '0123456789',
                  ),
                  GetContainerForProfile(
                      text1: 'Email', text2: 'johndoe@gmail.com'),
                  GetContainerForProfile(
                    text1: 'postal address',
                    text2: '',
                  ),
                  GetContainerForProfile(
                    text1: 'physical Address',
                    text2: '123 abc street',
                  ),
                  SizedBox(
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
