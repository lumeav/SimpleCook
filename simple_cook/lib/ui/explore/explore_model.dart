import 'package:flutter/foundation.dart';

class Filter {
  final Category? categories;
  final Enaehrungsart? enaehrungsart;
  final int? zuBereitungszeit;

  Filter({this.categories, this.enaehrungsart, this.zuBereitungszeit});
}

class Category {
  final String? alle;
  final String? vorspeise;
  final String? hauptspeise;
  final String? dessert;
  final String? snacks;

  Category({this.alle, this.vorspeise, this.hauptspeise, this.dessert, this.snacks});
}

class Enaehrungsart {
  final String? vegetarisch;
  final String? vegan;
  final String? glutenfrei;
  final String? laktosefrei;

  Enaehrungsart({this.vegetarisch, this.vegan, this.glutenfrei, this.laktosefrei});
}