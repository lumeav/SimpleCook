import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// This is the AppBar that is on every Screen saying "SimpleCook" in orange letters

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIcons.chefHat(PhosphorIconsStyle.regular),
            color: Colors.orange,
            size: 35,
          ),
          const SizedBox(width: 8.0), // Add some spacing between the icon and the text
          Text(
            title,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 30.0,
              fontFamily: 'BigShouldersText'
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0, // Remove shadow
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}