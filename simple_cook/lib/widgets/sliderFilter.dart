import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SliderFilter extends StatefulWidget {
  const SliderFilter({
    Key? key,
  }) : super(key: key);

  @override
  _SliderFilterState createState() => _SliderFilterState();
}

class _SliderFilterState extends State<SliderFilter> {
  double _currentSliderValue = 15;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.access_time_outlined, size: 30.0),
        SizedBox(
          width: 280,
          child: SfSliderTheme(
            data: SfSliderThemeData(
                //labelOffset: Offset(10.0, 0.0),
                activeTrackHeight: 7,
                inactiveTrackHeight: 7,
                activeTrackColor: Color(0xffFF9F5A),
                inactiveTrackColor: Color(0xffFF9F5A).withOpacity(0.3),
                thumbColor: Color(0xffFF9F5A)),
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
