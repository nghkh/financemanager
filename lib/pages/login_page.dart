import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/model/controller_login.dart';
import 'package:baitap/model/controller_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  ShowPasswords get showPasswords => Get.find<ShowPasswords>();

  CheckBoxController get checkBoxController => Get.find<CheckBoxController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Image.asset(
              '/assets/login_logo.png',
              width: 200,
              height: 200,
            ),
            const Text(
              'Đăng nhập để tiếp tục',
              style: AppTextStyle.textStyle3,
            ),
            const SizedBox(
              height: 30,
            ),
            const AppTextField(
              labelText: 'Tên đăng nhập',
              hintText: 'Nhập tên đăng nhập',
            ),
            AppTextField(
              labelText: 'Mật khẩu',
              hintText: 'Nhập mật khẩu',
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () => showPasswords.changeState(),
              ),
            ),
            Row(
              children: const [
                Text(
                  'Ghi nhớ tài khoản',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            AppButton(
              onPressed: (){},
              text: 'Đăng nhập',
            ),
          ],
        ),
      ),
    );
  }
}
