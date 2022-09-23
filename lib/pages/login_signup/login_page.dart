import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/firebase/controller.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // ShowPasswords get showPasswords => Get.find<ShowPasswords>();

  // EmailPassController get emailPassController => Get.find<EmailPassController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/login_logo.png',
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
              AppTextField(
                labelText: 'Email',
                hintText: 'Nhập E-mail',
                controller: Get.find<EmailPassController>().emailController,
                textInputAction: TextInputAction.done,
                // onSubmitted: (email) {
                //   EmailPassController().emailController.text;
                // },
              ),
              Obx(
                    () =>
                    AppTextField(
                      obscureText: Get.find<ShowPasswords>().obscureText.value,
                      hintText: 'Nhập mật khẩu',
                      labelText: 'Mật khẩu',
                      controller: Get.find<EmailPassController>().passwordController,
                      // onSubmitted: (password){EmailPassController().passwordController.text;},
                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                        icon: Icon(Get.find<ShowPasswords>().obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => Get.find<ShowPasswords>().changeState(),
                      ),
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
                onPressed: () {
                  AuthController.authInstance.login(
                    EmailPassController().emailController.text.trim(),
                    EmailPassController().passwordController.text.trim(),
                  );
                },
                text: 'Đăng nhập',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
