import 'package:jiffy/jiffy.dart';

class DateFormat {
  String dateOnly(DateTime date) =>
      Jiffy.parseFromDateTime(date).format(pattern: 'dd/MM/yyyy');
}
