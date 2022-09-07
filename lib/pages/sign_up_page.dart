import 'package:baitap/Widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const Text(
              'TẠO TÀI KHOẢN',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 28,),
            const Text(
              'Vui lòng nhập thông tin bên dưới',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const AppTextField(
              hintText: 'Nhập địa chỉ E-mail',
              labelText: 'Địa chỉ E-mail',
            ),
            const AppTextField(
              hintText: 'Nhập tên đăng nhập',
              labelText: 'Tên đăng nhập',
            ),
            const AppTextField(
              hintText: 'Nhập mật khẩu',
              labelText: 'Mật khẩu',
            ),
          ],
        ),
      ),
    );
  }
}
