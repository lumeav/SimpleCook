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
  static const _daysToNextWeek = 7;
  static const _daysToEndOfWeek = 6;
  late DateTime _begin;
  late DateTime _end;

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
    _begin = _getFirstDateOfWeek(DateTime.now());
    _end = _begin.add(const Duration(days: _daysToEndOfWeek));
  }

  void _onPressed(String buttonType) {
    setState(() {
      if (buttonType == 'prev') {
        if (!(_isSameDate(_begin, _getFirstDateOfWeek(DateTime.now())))) {
          _begin = _begin.subtract(const Duration(days: _daysToNextWeek));
          _end = _end.subtract(const Duration(days: _daysToNextWeek));
        }
      } else if (buttonType == 'next') {
        _begin = _begin.add(const Duration(days: _daysToNextWeek));
        _end = _end.add(const Duration(days: _daysToNextWeek));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () => _onPressed('prev'),
              icon:
                  const Icon(Icons.chevron_left, color: Colors.grey, size: 32)),
          Flexible(
            child: Text(
                "Wochenplan ${DateFormat('dd.MM', 'de_DE').format(_begin)} - ${DateFormat('dd.MM', 'de_DE').format(_end)}",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
          IconButton(
              onPressed: () => _onPressed('next'),
              icon:
                  const Icon(Icons.chevron_right, color: Colors.grey, size: 32))
        ],
      ),
    ));
  }
}
