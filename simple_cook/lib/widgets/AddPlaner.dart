import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart'; // Add this package to format dates

class AddPlaner extends StatefulWidget  {
  const AddPlaner({Key? key}) : super(key: key);

  @override
  _AddPlanerState createState() => _AddPlanerState();
}

class _AddPlanerState extends State<AddPlaner> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _showDatePickerDialog(context),
        icon: const FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.grey,
          size: 40,));
  }


  void _showDatePickerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(top: 10.0), // Adjust padding
        content: SizedBox(
          width: 300, // Adjust width as needed
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Wochenplaner',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 48), // Placeholder to balance the row
                ],
              ),
              Divider(),
              _buildDatePicker(),
            ],
          ),
        ),
      );
    },
  );
}

  Widget _buildDatePicker() {
    final List<String> dates = _generateNext14Days();
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView(
        children: dates.map((String date) {
          return ListTile(
            title: Text(date),
            onTap: () {
              setState(() {
                selectedDate = date;
                Navigator.of(context).pop();
              });
            },
          );
        }).toList(),
      ),
    );
  }

  List<String> _generateNext14Days() {
    final List<String> dates = [];
    final DateFormat dateFormat = DateFormat('EE dd.MM.yyyy', 'de_DE');

    for (int i = 0; i < 14; i++) {
      final DateTime date = DateTime.now().add(Duration(days: i));
      final String formattedDate = dateFormat.format(date);
      dates.add(formattedDate);
    }

    return dates;
  }
}