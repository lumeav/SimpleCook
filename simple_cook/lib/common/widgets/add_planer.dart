import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/constants.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/planner/planner_providers.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';


class AddPlaner extends ConsumerStatefulWidget {
  final SingleRecipe? recipe;

  const AddPlaner({
    super.key,
    this.recipe,
  });

  @override
  ConsumerState<AddPlaner> createState() => _AddPlanerState();
}

class _AddPlanerState extends ConsumerState<AddPlaner> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * SimpleCookRatios.addPlannerRatio;
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 3,
          )),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showDatePickerDialog(context),
          icon: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.grey,
            size: size,
          ),
        ),
      ),
    );
  }

  void _showDatePickerDialog(BuildContext context) {
    double size = MediaQuery.of(context).size.width * SimpleCookRatios.datePickerDialogRatio;
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: SizedBox(
            width: size,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Text(
                      'Wochenplaner',
                      style: SimpleCookTextstyles.subHeader,
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const Divider(),
                _buildDatePicker(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDatePicker() {
    final PlannerController plannerController = ref.watch(plannerControllerProvider);
    double size = MediaQuery.of(context).size.width * SimpleCookRatios.datePickerRatio;
    final List<String> dates = _generateNext14Days();
    return SizedBox(
      height: size,
      child: ListView(
        children: dates.map((String date) {
          return ListTile(
            title: Text(date),
            onTap: () async {
                selectedDate = date;
                if (widget.recipe != null && selectedDate != null) {
                  bool added = await plannerController.addPlanner(selectedDate!.substring(4), widget.recipe!);
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: added ? Text('Rezept wurde für den $selectedDate hinzugefügt') :
                    Text('Rezept existiert schon für den $selectedDate'),
                    duration: SimpleCookDurations.datePickerDuration,
                  ),
                );
                }
                setState(() {
              })
              ;
            },
          );
        }).toList(),
      ),
    );
  }

  List<String> _generateNext14Days() {
    final List<String> dates = <String>[];
    final DateFormat dateFormat = DateFormat('EE dd.MM.yyyy', 'de_DE');

    for (int i = 0; i < 14; i++) {
      final DateTime date = DateTime.now().add(Duration(days: i));
      final String formattedDate = dateFormat.format(date);
      dates.add(formattedDate);
    }
    return dates;
  }
}

