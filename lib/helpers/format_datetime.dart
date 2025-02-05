String formatDateTime(DateTime dateTime) {
  final day = _zeroPad(dateTime.day);

  final month = _zeroPad(dateTime.month);

  final year = dateTime.year;

  return '$day.$month.$year';
}

String _zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }

  return dateTimeValue.toString();
}
