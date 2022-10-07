import 'package:baitap/Widget/date_picker.dart';
import 'package:baitap/Widget/gender_drop_down.dart';
import 'package:baitap/Widget/profile_pic.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => ProfileInfoState();
}

class ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
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
                  SizedBox(height: 20),
                  const AppTextField(
                    hintText: 'Nhập họ',
                    labelText: 'Họ',
                  ),
                  const AppTextField(
                    hintText: 'Nhập tên đệm và tên',
                    labelText: 'Tên đệm và tên',
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GetDropDown(
                      items: dropdownGender,
                      hint: "giới tính",
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GetDropDown(
                      items: dropdownMarial,
                      hint: "tình trạng hôn nhân",
                    ),
                  ),
                  Text('Ngày sinh'),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DatePickerApp()),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
