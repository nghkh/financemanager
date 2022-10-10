import 'package:baitap/Widget/date_picker.dart';
import 'package:baitap/Widget/gender_drop_down.dart';
import 'package:baitap/Widget/text_field.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/pages/transcations_page/controller/transcation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionsPage extends StatelessWidget {
  const AddTransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Thêm giao dịch',
          style: AppTextStyle.textStyle4Black,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await Get.find<addTransactionController>().set(
                  Get.find<TranscationsPageController>().textController.text,
                  Get.find<TranscationsPageController>().selectedValue.value);
              Get.back();
            },
            child: const Text(
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
                  controller:
                      Get.find<TranscationsPageController>().textController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppDropDown(
                  value: Get.find<TranscationsPageController>()
                      .selectedValue
                      .value,
                  items: Get.find<TranscationsPageController>()
                      .listKindsofTrans
                      .map((element) => DropdownMenuItem(
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
                  onChanged: (value) =>
                      Get.find<TranscationsPageController>().onChanged(value),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Obx(
                    () => AppDatePicker(
                      onPressed: () {
                        Get.find<TranscationsPageController>().chooseDate();
                      },
                      selectedDate: Get.find<TranscationsPageController>()
                          .selectedDate
                          .value,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
