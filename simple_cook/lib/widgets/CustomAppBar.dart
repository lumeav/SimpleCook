import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(  
        title,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0, // Remove shadow
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}