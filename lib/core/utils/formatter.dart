import 'package:intl/intl.dart';

class Formatter {
  const Formatter._();

  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('dd MMM yyyy HH:mm');
  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  static final NumberFormat _decimalFormat = NumberFormat('#,##0.##', 'id_ID');

  static String date(DateTime date) => _dateFormat.format(date);

  static String dateTime(DateTime date) => _dateTimeFormat.format(date);

  static String currency(num value) => _currencyFormat.format(value);

  static String decimal(num value) => _decimalFormat.format(value);

  static String phone(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10) return value;
    return '${digits.substring(0, 4)}-${digits.substring(4, 8)}-${digits.substring(8)}';
  }
}
