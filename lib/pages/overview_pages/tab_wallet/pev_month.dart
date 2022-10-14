import 'package:flutter/material.dart';

class PreviousMonth extends StatelessWidget {
  const PreviousMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Chưa có dữ liệu được ghi',
            style: TextStyle(
              fontSize: 32,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
