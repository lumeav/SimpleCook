import 'package:flutter/material.dart';
import 'package:simple_cook/common/navbar.dart';
import 'package:simple_cook/widgets/CustomAppBar.dart';

class CommonView extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Widget child;

  CommonView({required this.selectedIndex, required this.onItemTapped, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'SimpleCook'), // Use CustomAppBar here
      body: Container(
        color: Colors.grey[200],
        child: child,
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}