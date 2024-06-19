import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/common/theme.dart';

class Date extends StatelessWidget {
  final DateTime date;

  const Date(this.date, {super.key,});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, dd.MM.yyyy', 'de_DE').format(date);
    return Text(
      formattedDate,
      style: SimpleCookTextstyles.date
    );
  }
}