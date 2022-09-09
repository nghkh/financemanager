import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/model/controller_signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  ShowPasswords get showPasswords => Get.find<ShowPasswords>();

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
            const SizedBox(height: 42),
            const Text(
              'Vui lòng nhập thông tin bên dưới',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 90),
            const AppTextField(
              hintText: 'Nhập địa chỉ E-mail',
              labelText: 'Địa chỉ E-mail',
            ),
            const SizedBox(height: 80),
            const AppTextField(
              hintText: 'Nhập tên đăng nhập',
              labelText: 'Tên đăng nhập',
            ),
            const SizedBox(height: 80),
            Obx(
              () => AppTextField(
                obscureText: showPasswords.obscureText.value,
                hintText: 'Nhập mật khẩu',
                labelText: 'Mật khẩu',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () => showPasswords.changeState(),
                ),
              ),
            ),
            const SizedBox(height: 153),
            AppButton(
              onPressed: () => Container(),
              text: 'Đăng ký',
            ),
            const SizedBox(height: 86),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Đã có tài khoản? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Đăng nhập',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
