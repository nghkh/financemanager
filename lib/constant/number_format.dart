import 'package:intl/intl.dart';

extension Numberic on String {
  String toMoneyString(){
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return myFormat.format(this);
  }
}
