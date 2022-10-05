import 'package:baitap/Widget/gender_drop_down.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/pages/transcations_page/controller/transcation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionsPage extends StatelessWidget {
  TranscationsPageController get controller =>
      Get.put<TranscationsPageController>(TranscationsPageController());

  const AddTransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Thêm giao dịch',
          style: AppTextStyle.textStyle4Black,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Lưu',
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Column(
              children: [
                AppTextFormField(
                  controller: controller.textController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                AppDropDown(
                  value: controller.selectedValue.value,
                  items: controller.listKindsofTrans
                      .map((element) =>
                      DropdownMenuItem(
                        value: element.value,
                        child: Row(
                          children: [
                            element.image,
                            Text(
                              element.text,
                              style: AppTextStyle.textStyle3,
                            ),
                          ],
                        ),
                      ))
                      .toList(),
                  onChanged: (value) => controller.onChanged(value),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
