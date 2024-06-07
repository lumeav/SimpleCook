import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  final DateTime date;

  Date(this.date, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, dd.MM.yyyy', 'de_DE').format(date);
    return Text(
      formattedDate,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)
    );
  }
}