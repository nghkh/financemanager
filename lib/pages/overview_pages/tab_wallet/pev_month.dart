import 'package:flutter/material.dart';

class PreviousMonth extends StatelessWidget {
  const PreviousMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: const [
                      Text('Số dư'),
                      Expanded(child: SizedBox()),
                      Text('10000000'),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Tiền ra'),
                      Expanded(child: SizedBox()),
                      Text('500000'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: const [
                      Expanded(child: SizedBox()),
                      Text('9500000'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
