import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';

class AddTransactionsPage extends StatelessWidget {
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
      body: Column(
        children: [

        ],
      ),
    );
  }
}
