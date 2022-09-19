import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';

class OverviewWallet extends StatelessWidget {
  const OverviewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Số dư',
              style: AppTextStyle.textStyle3Grey,),
            Text('100000 VNĐ',
              style: AppTextStyle.textStyle1,),
          ],
        ),
        bottom:,
      ),
    );
  }
}
