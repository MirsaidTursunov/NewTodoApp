import 'package:intl/intl.dart';

class BaseFunction {
  BaseFunction._();

  static String dayFormatter(DateTime str) {
    return DateFormat('EEEE').format(str);
  }

  static String dayMonthYearFormatter(DateTime str) {
    return DateFormat('dd MMMM yyyy').format(str);
  }
}
