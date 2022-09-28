import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DatePickerController extends GetxController {
  var selectedDate = DateTime.now().obs;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2023),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }
}