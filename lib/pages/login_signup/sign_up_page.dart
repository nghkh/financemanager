import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  'TẠO TÀI KHOẢN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Vui lòng nhập thông tin bên dưới',
                  style: AppTextStyle.textStyle2,
                ),
                const SizedBox(height: 32),
                const AppTextField(
                  hintText: 'Nhập địa chỉ E-mail',
                  labelText: 'Địa chỉ E-mail',
                ),
                Obx(
                  () => AppTextField(
                    obscureText: showPasswords.obscureText.value,
                    hintText: 'Nhập mật khẩu',
                    labelText: 'Mật khẩu',
                    suffixIcon: IconButton(
                      icon: Icon(showPasswords.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => showPasswords.changeState(),
                    ),
                  ),
                ),
                const SizedBox(height: 24-16),
                AppButton(
                  onPressed: () => Container(),
                  text: 'Đăng ký',
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Đã có tài khoản? ',
                        style: AppTextStyle.textStyle2,
                      ),
                      TextSpan(
                        text: 'Đăng nhập',
                        style: AppTextStyle.textStyle2Green,
                        recognizer: TapGestureRecognizer()..onTap = () {
                         Get.toNamed('/login'); // Single tapped.
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
