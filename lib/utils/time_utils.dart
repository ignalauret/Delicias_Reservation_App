class TimeUtils {
  static getDurationFromIndex(int index) {
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
}