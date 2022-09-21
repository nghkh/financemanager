import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class getContainerForProfile extends StatelessWidget {
  final String? Text1;
  final String? Text2;
  const getContainerForProfile({Key? key, this.Text1, this.Text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Text1!,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                inherit: false,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Text2!,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                inherit: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          getContainerForProfile(
            Text1: 'Text1',
            Text2: 'Text2',
          ),
          getContainerForProfile(
            Text1: 'Text1',
            Text2: 'Text2',
          ),
        ],
      ),
    ),
  ));
}
