import 'package:flutter/material.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/widgets/simple_cook_appbar.dart';

class CommonView extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Widget child;

  CommonView({required this.selectedIndex, required this.onItemTapped, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleCookAppBar('SimpleCook'), // Use CustomAppBar here
      body: Container(
        color: Colors.grey[200],
        child: child,
      ),
    );
  }
}