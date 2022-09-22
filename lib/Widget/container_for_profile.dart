import 'package:flutter/material.dart';

class GetContainerForProfile extends StatelessWidget {
  final String? text1;
  final String? text2;
  const GetContainerForProfile({Key? key, this.text1, this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
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
              text1!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
                inherit: false,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text2!,
              style: const TextStyle(
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
