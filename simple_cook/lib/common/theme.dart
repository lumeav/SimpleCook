import 'package:flutter/material.dart';

class SimpleCookColors {
  static const Color primary = Color(0xffFF9F5A);
  static const Color secondary = Colors.white;
  static Color? backgroundColor = Colors.grey[200];
  static const Color searchBar = Color(0xffFFECDF);
  static const Color border = Color.fromARGB(255, 127, 127, 127);
}

class SimpleCookTextstyles {
  static const TextStyle appBar = TextStyle(
      color: SimpleCookColors.primary,
      fontSize: 40,
      fontFamily: 'BigShouldersText');
  static const TextStyle date =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22);
  static const TextStyle filterTagTapped = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle filterTagUntapped = TextStyle(
    color: SimpleCookColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle header =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);
  static const TextStyle subHeader =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle recHeader =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle rezeptDesTages =
      TextStyle(color: SimpleCookColors.primary, fontSize: 18);
  static const TextStyle rawText = TextStyle(fontSize: 18);
  static const TextStyle steps = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
  );
  static const TextStyle recInfos = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle portions = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const TextStyle ingedients = TextStyle(fontSize: 20);
  static const TextStyle easterEgg =
      TextStyle(color: SimpleCookColors.primary, fontSize: 24);
  static const TextStyle error = TextStyle(color: Colors.grey);
  static const TextStyle emptyView = TextStyle(fontSize: 17, color: Colors.grey);
}
