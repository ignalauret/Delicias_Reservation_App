import 'package:delicias_turns_app/utils/constants.dart';

class TimeUtils {
  static String getDurationFromIndex(int index) {
    String res = "";
    final time = 0.5 + index * 0.5;
    final hour = time.floor();
    if(hour == 1) {
      res = "1 hora";
    } else {
      res = "$hour horas";
    }
    if(index % 2 == 0) {
      res += " y media";
    }
    return res;
  }

  static String getHourFromIndex(int index) {
    final hour = Constants.kStartingHour + (index / 2).floor();
    final minute = index % 2 == 0 ? "00" : "30";
    return "$hour:$minute";
  }

  static DateTime getDateWithHourIndex(DateTime date, int hourIndex) {
    final year = date.year;
    final month = date.month;
    final day = date.day;
    final hour = Constants.kStartingHour + (hourIndex / 2).floor();
    final minute = hourIndex % 2 == 0 ? 0 : 30;
    return DateTime(year, month, day, hour, minute);
  }
}