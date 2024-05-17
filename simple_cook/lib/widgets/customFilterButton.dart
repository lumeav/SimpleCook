import 'package:flutter/material.dart';

//This is the filter symbol that would lead to the filter screen when pressed

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        // Navigate to the planner view for now later it leads to filter
        Navigator.pushNamed(context, '/planner');
      },
    );
  }
}