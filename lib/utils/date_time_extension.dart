import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static final _formatter = DateFormat('LLL y');

  String get formattedDate => _formatter.format(this);
}
