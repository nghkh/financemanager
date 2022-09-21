import 'package:baitap/Widget/datePicker.dart';
import 'package:baitap/Widget/genderDropDown.dart';
import 'package:baitap/Widget/profilePic.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) {
  runApp(Profile_info());
}

class Profile_info extends StatefulWidget {
  const Profile_info({super.key});

  @override
  State<Profile_info> createState() => _Profile_infoState();
}

class _Profile_infoState extends State<Profile_info> {
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
                    hintText: 'Nhập tên đệm',
                    labelText: 'Tên đệm',
                  ),
                  const AppTextField(
                    hintText: 'Nhập tên',
                    labelText: 'Tên',
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: getDropDown(
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
                    child: getDropDown(
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
                      child: DatePickerDemo()),
                  SizedBox(height: 20),
                  const AppTextField(
                    hintText: 'Nhập tên ngân hàng',
                    labelText: 'Tên ngân hàng',
                  ),
                  const AppTextField(
                    hintText: 'Nhập số tài khoản',
                    labelText: 'Số tài khoản',
                  ),
                  const AppTextField(
                    hintText: 'Nhập số BVN',
                    labelText: 'Số BVN',
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
