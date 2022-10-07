import 'package:baitap/Widget/controller/date_picker_controller.dart';
import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({Key? key}) : super(key: key);

  DatePickerController get controller => Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => controller.selectedDate,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.grey,
              backgroundColor: const Color.fromARGB(255, 250, 250, 250),
              minimumSize: const Size(88, 50),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            child: Row(
              children: [
                Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${controller.selectedDate.value.toLocal()}"
                            .split(' ')[0],
                        style: AppTextStyle.textStyle3GBold,
                      ),
                    )),
                const Spacer(),
                const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppDatePicker extends StatelessWidget {
  final Function() onPressed;
  final DateTime selectedDate;

  const AppDatePicker({
    Key? key,
    required this.onPressed,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            minimumSize: const Size(88, 50),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat('dd/MM/yyyy').format(selectedDate).toString(),
                  style: AppTextStyle.textStyle3GBold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
