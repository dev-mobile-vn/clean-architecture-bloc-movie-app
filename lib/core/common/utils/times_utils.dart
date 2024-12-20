import 'package:intl/intl.dart';

formatDateTime(String date) => date.isNotEmpty
    ? DateFormat("dd-MM-yyyy").format(DateTime.parse(date))
    : "";
