import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simple_cook/common/theme.dart';

// This is the AppBar that is on every Screen saying "SimpleCook" in orange letters

class SimpleCookAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SimpleCookAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(

        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          PhosphorIcon(
            PhosphorIcons.chefHat(PhosphorIconsStyle.regular),
            color: SimpleCookColors.primary,
            size: 45,
          ),
          const SizedBox(
              width: 8.0), // Add some spacing between the icon and the text
          Text(
            title,
            style: const TextStyle(
                color: SimpleCookColors.primary,
                fontSize: 40,
                fontFamily: 'BigShouldersText'),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0, // Remove shadow
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
