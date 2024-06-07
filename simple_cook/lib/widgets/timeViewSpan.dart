import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeViewSpan extends StatefulWidget {
  TimeViewSpan({
    Key? key,
  }) : super(key: key);

  @override
  _TimeViewSpanState createState() => _TimeViewSpanState();
}

class _TimeViewSpanState extends State<TimeViewSpan> {
  late DateTime begin;
  late DateTime end;

  DateTime _getFirstDateOfWeek(DateTime date) {
    int dayOffset = date.weekday - DateTime.monday;
    DateTime firstDateOfWeek = date.subtract(Duration(days: dayOffset));
    return firstDateOfWeek;
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  void initState() {
    super.initState();
    begin = _getFirstDateOfWeek(DateTime.now());
    end = begin.add(const Duration(days: 6));
  }

  void _onPressed(String buttonType) {
    setState(() {
      if (buttonType == 'prev') {
        if (!(_isSameDate(begin, _getFirstDateOfWeek(DateTime.now())))) {
          begin = begin.subtract(const Duration(days: 7));
          end = end.subtract(const Duration(days: 7));
        }
      } else if (buttonType == 'next') {
        begin = begin.add(const Duration(days: 7));
        end = end.add(const Duration(days: 7));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => _onPressed('prev'),
            icon: const Icon(Icons.chevron_left, color: Colors.grey, size: 32)),
        Text(
            "Wochenplan ${DateFormat('dd.MM', 'de_DE').format(begin)} - ${DateFormat('dd.MM', 'de_DE').format(end)}",
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        IconButton(
            onPressed: () => _onPressed('next'),
            icon: const Icon(Icons.chevron_right, color: Colors.grey, size: 32))
      ],
    );
  }
}
