import 'package:intl/intl.dart';

class TFormatter {
  static String formateDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formateCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitalOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    String countryCode = '+${digitalOnly.substring(0, 2)}';
    digitalOnly = digitalOnly.substring(2);

    final formattedNumber = StringBuffer();

    int i = 0;
    while (i < digitalOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitalOnly.substring(i, end));

      if (end < digitalOnly.length) {
        formattedNumber.write('');
      }
      i = end;
    }
    return '$formattedNumber';
  }
}
