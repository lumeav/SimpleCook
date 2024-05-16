import 'package:flutter/material.dart';
import 'package:simple_cook/ui/main_widgets/navbar.dart';

class CommonView extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Widget child;

  CommonView({required this.selectedIndex, required this.onItemTapped, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleCook'),
        automaticallyImplyLeading: false,
      ),
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