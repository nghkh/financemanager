import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabWalletController extends GetxController {

  Widget kindsofSpending(String kind) {
    switch(kind){
      case '1' :
        return Image.asset(
          'assets/icons/eat.png',
          width: 36,
          height: 36,
        );
      case '2' :
        return Image.asset(
          'assets/icons/invoice.png',
          width: 36,
          height: 36,
        );
      case '3':
        return Image.asset(
          'assets/icons/rent.png',
          width: 36,
          height: 36,
        );
      case '4' :
        return Image.asset(
          'assets/icons/energy.png',
          width: 36,
          height: 36,
        );
      case '5' :
        return Image.asset(
          'assets/icons/faucet.png',
          width: 36,
          height: 36,
        );
      default :
        return Image.asset(
          'assets/icons/question.png',
          width: 36,
          height: 36,
        );
    }
  }

}