import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/ButtonFilter.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/CustomButton.dart';

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
            title: Text('CustomButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomButtonDemo()),
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
        ],
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

class CustomButtonDemo extends StatefulWidget {
  @override
  _CustomButtonDemoState createState() => _CustomButtonDemoState();
}


class _CustomButtonDemoState extends State<CustomButtonDemo> {
  bool _buttonActivated = false;

  void _handleButtonPressed(bool activated) {
    setState(() {
      _buttonActivated = activated;
    });
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Button Demo')),
      body: Center(
        child: CustomButton(
          text: 'Press Me',
          activated: _buttonActivated,
          onPressed: _handleButtonPressed,
        ),
      ),
    );
  }
}