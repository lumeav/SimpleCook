import 'package:flutter/material.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/CustomButton.dart';

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
        ],
      ),
    );
  }
}

class CustomAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Demo AppBar'),
      body: Center(
        child: Text('This is a custom AppBar'),
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