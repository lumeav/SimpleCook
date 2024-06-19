import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/common/theme.dart';

class AddPlaner extends StatefulWidget  {
  const AddPlaner({super.key});

  @override
  State<AddPlaner> createState() => _AddPlanerState();
}

class _AddPlanerState extends State<AddPlaner> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.075;
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3,
        )
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showDatePickerDialog(context),
          icon: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.grey,
            size: size,
          ),
        ),
      ),
    );
  }


  void _showDatePickerDialog(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.75;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.only(top: 10.0),
        content: SizedBox(
          width: size,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'Wochenplaner',
                    style: SimpleCookTextstyles.subheader,
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const Divider(),
              _buildDatePicker(),
            ],
          ),
        ),
      );
    },
  );
}

  Widget _buildDatePicker() {
    var size = MediaQuery.of(context).size.width * 0.40;
    final List<String> dates = _generateNext14Days();
    return SizedBox(
      height: size,
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