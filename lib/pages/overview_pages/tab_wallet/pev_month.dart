import 'package:flutter/material.dart';

class PreviousMonth extends StatelessWidget {
  const PreviousMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text('Số dư'),
                Expanded(child: SizedBox()),
                Text('10000000'),
              ],
            ),
            Row(
              children: [
                Text('Tiền ra'),
                Expanded(child: SizedBox()),
                Text('500000'),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text('9500000'),
              ],
            ),
            Container(color: Colors.grey[400], height: 16,),
          ],
        ),
      ),
    );
  }
}
