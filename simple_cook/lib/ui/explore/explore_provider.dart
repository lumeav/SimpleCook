import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/explore/explore_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';


class ExploreControllerProvider extends ChangeNotifier {

  Filter? filteR;

  void setFilter(Filter? filter) {
    filteR = filter;
    notifyListeners();
  }
  Filter getFilter() {
    return filteR!;
  }
}

final exploreControllerProvider = ChangeNotifierProvider<ExploreControllerProvider>((ref) {
  return ExploreControllerProvider();
});

