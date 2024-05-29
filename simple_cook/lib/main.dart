import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/buttonFilter.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'widgets/appBar.dart';


//This is main_dummy.dart to test widgets using dummy data. It is currently named "main.dart" to ensure starting this after starting the application

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('CustomAppBar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomAppBarDemo()),
              );
            },
          ),
          ListTile(
            title: Text('ButtonFilter'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomButtonFilter()),
              );
            },
          ),
          ListTile(
            title: Text('SliderFilter'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomSliderFilter()),
              );
            },
          ),
        ],
      ),
    );
  }
}


class CustomSliderFilter extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSliderFilter> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Slider Demo')),
      body: Center(
        child: CustomSlider(),
      ),

    );
  }
}

class CustomAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SimpleCook'),
      body: Center(
        child: Text('This is a custom AppBar'),
      ),
    );
  }
}

class CustomButtonFilter extends StatefulWidget {
  @override
  _CustomButtonFilterState createState() => _CustomButtonFilterState();
}

class _CustomButtonFilterState extends State<CustomButtonFilter> {
  bool _pressed = false;

  void _onPressed() {
    setState(() {
      _pressed = !_pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Filter Demo')),
      body: Center(
        child: ButtonFilter(
          text: 'Vorspeise',
          width: 150,
          height: 50,
        ),
      ),
    );
  }
}
