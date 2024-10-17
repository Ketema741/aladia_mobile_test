String timeFormater(String dateString) {
  RegExp timeRegExp = RegExp(r'\d{2}:\d{2}:\d{2}');
  Match? match = timeRegExp.firstMatch(dateString);

  if (match != null) {
    String timePart = match.group(0)!; // HH:mm:ss part
    List<String> timeParts = timePart.split(':');
    String hour = timeParts[0].padLeft(2, '0');
    String minute = timeParts[1].padLeft(2, '0');
    return "$hour:$minute";
  } else {
    throw FormatException("Invalid date format");
  }
}
