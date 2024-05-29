import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CustomSlider extends StatefulWidget {

  const CustomSlider({Key? key,}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 15;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(Icons.access_time_outlined, size: 30.0),
        SizedBox(
          width: 280,
          child: SfSliderTheme(
            data: SfSliderThemeData(
                //labelOffset: Offset(10.0, 0.0),
                activeTrackHeight: 7,
                inactiveTrackHeight: 7,
                activeTrackColor: Colors.orange,
                inactiveTrackColor: Colors.orange.withOpacity(0.3),
                thumbColor: Colors.orange),
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
