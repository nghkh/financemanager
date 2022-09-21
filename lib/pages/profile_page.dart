import 'package:baitap/Widget/containerForProfile.dart';
import 'package:baitap/Widget/profilePic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profile_page extends StatelessWidget {
  const profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
                          Get.to('/profile_basicInfo');
                        },
                      ),
                    ],
                  ),
                  getContainerForProfile(
                    Text1: 'first name',
                    Text2: 'John',
                  ),
                  getContainerForProfile(
                    Text1: 'last name',
                    Text2: 'Doe',
                  ),
                  getContainerForProfile(
                    Text1: 'System ID member',
                    Text2: '123456789',
                  ),
                  getContainerForProfile(
                    Text1: 'ID member',
                    Text2: 'user name',
                  ),
                  getContainerForProfile(Text1: 'gender', Text2: 'Male'),
                  getContainerForProfile(
                    Text1: 'Martial Status',
                    Text2: 'Single',
                  ),
                  getContainerForProfile(
                    Text1: 'Date of birth',
                    Text2: '01/01/2000',
                  ),
                  getContainerForProfile(
                    Text1: 'Join date',
                    Text2: '10/10/2020',
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
                          Get.to('/profile_contactInfo');
                        },
                      ),
                    ],
                  ),
                  getContainerForProfile(
                    Text1: 'Mobile phone 1',
                    Text2: '0123456789',
                  ),
                  getContainerForProfile(
                    Text1: 'Mobile phone 2',
                    Text2: '0123456789',
                  ),
                  getContainerForProfile(
                    Text1: 'Email',
                    Text2: 'johndoe@gmail.com',
                  ),
                  getContainerForProfile(
                    Text1: 'Address',
                    Text2: '123 abc street',
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
                          Get.to('/nextOfKin');
                        },
                      ),
                    ],
                  ),
                  getContainerForProfile(
                    Text1: 'Name',
                    Text2: 'Jane Doe',
                  ),
                  getContainerForProfile(
                    Text1: 'Relationship',
                    Text2: 'Wife',
                  ),
                  getContainerForProfile(
                    Text1: 'Mobile phone',
                    Text2: '0123456789',
                  ),
                  getContainerForProfile(
                      Text1: 'Email', Text2: 'johndoe@gmail.com'),
                  getContainerForProfile(
                    Text1: 'postal address',
                    Text2: '',
                  ),
                  getContainerForProfile(
                    Text1: 'physical Address',
                    Text2: '123 abc street',
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

void main(List<String> args) {
  runApp(MaterialApp(
    home: profile_page(),
  ));
}
