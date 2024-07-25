import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SliderFilter extends StatefulWidget {
  const SliderFilter({
    super.key,
  });

  @override
  State<SliderFilter> createState() => _SliderFilterState();
}

class _SliderFilterState extends State<SliderFilter> {
  double _currentSliderValue = 15;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time_outlined, size: 34.0, color: Colors.grey[600]),
 Expanded (child:SfSliderTheme(
            data: SfSliderThemeData(
                activeTrackHeight: 7,
                inactiveTrackHeight: 7,
                activeTrackColor: SimpleCookColors.primary,
                inactiveTrackColor: SimpleCookColors.primary.withOpacity(0.3),
                thumbColor: SimpleCookColors.primary),
            child: SfSlider(
              min: 0.0,
              max: 60.0,
              value: _currentSliderValue,
              interval: 15,
              showDividers: true,
              showTicks: true,
              showLabels: true,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
 )
      ],
    );
  }
}
