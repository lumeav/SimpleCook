import 'package:flutter/material.dart';

class SimpleCookColors {
  static const Color primary = Color(0xffFF9F5A);
  static const Color searchBar = Color(0xffFFECDF);
  static const Color border = Color.fromARGB(255, 127, 127, 127);
}

class SimpleCookTextstyles {
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
  static const TextStyle subheader =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle recheader =
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
}

class SimpleCookIngredientList {
  static const List<String> kOptions = <String>[
    'Tomaten',
    'Kartoffel',
    'Ei',
    'Karrotte',
    'Zwiebel',
    'Knoblauch',
    'Paprika',
    'Gurke',
    'Salat',
    'Erdbeere',
    'Lachs',
    'Hähnchenbrust',
    'Reis',
    'Thunfisch',
    'Sojasoße',
    'Milch',
    'Butter',
    'Rinderhackfleisch',
    'Honig',
    'Zitrone',
    'Essig',
    'Orange',
    'Apfel',
    'Banane',
    'Sahne',
    'Quark',
    'Joghurt',
    'Käse',
    'Schweinefilet',
    'Fischfilet',
    'Nudeln',
    'Mehl',
    'Kümmel',
    'Paprikapulver',
    'Muskatnuss',
    'Basilikum',
    'Petersilie',
    'Dill',
    'Thymian',
    'Rosmarin',
    'Oregano',
    'Majoran',
    'Senf',
    'Öl',
    'Sonnenblumenöl',
    'Olivenöl',
    'Margarine',
    'Schmand',
    'Saure Sahne',
    'Mayonnaise',
    'Tomatenmark',
    'Ketchup',
    'Hühnerbrühe',
    'Gemüsebrühe',
    'Worcestersauce',
    'Rotwein',
    'Weißwein',
    'Bier',
    'Hefe',
    'Vanillezucker',
    'Backpulver',
    'Natron',
    'Speisestärke',
    'Gelatine',
    'Frischkäse',
    'Parmesan',
    'Mozzarella',
    'Gouda',
    'Emmentaler',
    'Salami',
    'Schinken',
    'Speck',
    'Sauerkraut',
    'Rotkohl',
    'Grünkohl',
    'Weißkohl',
    'Blumenkohl',
    'Brokkoli',
    'Spargel',
    'Spinat',
    'Pilze',
    'Champignons',
    'Erbsen',
    'Bohnen',
    'Linsen',
    'Kichererbsen',
    'Mandeln',
    'Haselnüsse',
    'Cashewkerne',
    'Walnüsse',
    'Rosinen',
  ];
}
