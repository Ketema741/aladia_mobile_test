String getDayName(int dayNumber) {
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  if (dayNumber >= 0 && dayNumber <= 6) {
    return days[dayNumber];
  } else {
    return '';
  }
}
