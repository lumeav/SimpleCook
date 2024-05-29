import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/buttonFilter.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'package:simple_cook/widgets/searchRecipeButton.dart';
import 'package:simple_cook/widgets/filterIcon.dart';
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
          ListTile(
            title: Text('searchRecipeButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomSearchRecipesButton()),
              );
            },
          ),
          ListTile(
            title: Text('FilterIcon'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomFilterIcon()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomFilterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Icon Demo')),
      body: Center(
        child: FilterIcon(),
      ),
    );
  }
}

class CustomSearchRecipesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Recipe Button Demo')),
      body: Center(
        child: SearchRecipesButton('Rezepte Suchen'),
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
    return const Scaffold(
      appBar: CustomAppBar('SimpleCook'),
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
      body: const Center(
        child: ButtonFilter(
          'Vorspeise',
          50,
          150,
        ),
      ),
    );
  }
}
