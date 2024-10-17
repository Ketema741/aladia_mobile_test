import 'package:intl/intl.dart';

bool isOpen(int startDay, int endDay, String opening, String closing) {
  DateTime now = DateTime.now();
  int currentDay = now.weekday;
  String formattedCurrentTime = DateFormat('HH:mm').format(now);

  currentDay = (currentDay % 7);

  String parseTime(String dateString) {
    RegExp timeRegExp = RegExp(r'\d{2}:\d{2}:\d{2}');
    Match? match = timeRegExp.firstMatch(dateString);

    if (match != null) {
      String timePart = match.group(0)!; // HH:mm:ss part
      List<String> timeParts = timePart.split(':');
      String hour = timeParts[0].padLeft(2, '0');
      String minute = timeParts[1].padLeft(2, '0');
      return "$hour:$minute";
    } else {
      throw const FormatException("Invalid date format");
    }
  }

  String openingTime = parseTime(opening);
  String closingTime = parseTime(closing);

  bool dayInRange = (startDay <= endDay)
      ? (currentDay >= startDay && currentDay <= endDay)
      : (currentDay >= startDay || currentDay <= endDay);

  bool timeInRange = (formattedCurrentTime.compareTo(openingTime) >= 0 &&
      formattedCurrentTime.compareTo(closingTime) <= 0);

  return dayInRange && timeInRange;
}
