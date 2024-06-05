import 'package:flutter/material.dart';
import 'package:simple_cook/widgets/buttonFilter.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'package:simple_cook/widgets/searchRecipeButton.dart';
import 'package:simple_cook/widgets/filterIcon.dart';
import 'package:simple_cook/widgets/buttonHeart.dart';
import 'package:simple_cook/widgets/recipeInfos.dart';
import 'package:simple_cook/widgets/searchBar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/ImgAndHeart.dart';
import 'package:simple_cook/widgets/RezeptdesTages.dart';
import 'package:simple_cook/widgets/singleRecipeButton.dart';
import 'package:simple_cook/widgets/whiteBackground.dart';
import 'package:simple_cook/widgets/recipePortion.dart';
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
          ListTile(
            title: Text('ButtonHeart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomButtonHeart()),
              );
            },
          ),
          ListTile(
            title: Text('RecipeInfos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomRecipeInfos()),
              );
            },
          ),
          ListTile(
            title: Text('SearchBarFilter'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomSearchbarFilter()),
              );
            },
          ),
          ListTile(
              title: Text('GreyBackground'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomGreyBackground()),
                );
              }),
          ListTile(
            title: Text('ImgAndHeart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomImg()),
              );
            },
          ),
          ListTile(
            title: Text('Rezept des Tages'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomRezeptDesTages()),
              );
            },
          ),
          ListTile(
            title: Text('singleRecipeButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomSingleRecipeButton()),
              );
            },
          ),
          ListTile(
            title: Text('whiteBackground'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomWhiteBackground()),
              );
            },
          ),
          ListTile(
            title: Text('CustomPortionSize'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPortionSize()),
              );
            },
          )
        ],
      ),
    );
  }
}

class CustomPortionSize extends StatefulWidget {
  @override
  _CustomPortionSizeState createState() => _CustomPortionSizeState();
}

class _CustomPortionSizeState extends State<CustomPortionSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portion Size Demo')),
      body: Center(
        child: RecipePortion(),
      ),
    );
  }
}

class CustomWhiteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('White Background Demo')),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: WhiteBackground()
        ),
      );

  }
}

class CustomSingleRecipeButton extends StatefulWidget {
  @override
  _CustomSingleRecipeButtonState createState() =>
      _CustomSingleRecipeButtonState();
}

class _CustomSingleRecipeButtonState extends State<CustomSingleRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Single Recipe Button Demo')),
        backgroundColor: Colors.white,
        body: const Column(
          children: [
            RezeptdesTages('assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                singleRecipeButton('assets/tinga-de-pollo.jpg', 'Tinga de Pollo'),
                singleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
              ],
            ),
        ]));
  }
}

class CustomRezeptDesTages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rezept des Tages Demo')),
      body: Center(
        child: RezeptdesTages('assets/flammkuchen.jpg', 'Flammkuchen'),
      ),
    );
  }
}

class CustomImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ImgAndHeart Demo')),
      body: Center(
        child: ImgAndHeart('assets/flammkuchen.jpg', true, 352, 189),
      ),
    );
  }
}

class CustomGreyBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('SimpleCook'),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: GreyBackground(),
      ),
    );
  }
}

class CustomRecipeInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Infos Demo')),
      body: Center(
        child: RecipeInfos("30min", "einfach"),
      ),
    );
  }
}

class CustomButtonHeart extends StatefulWidget {
  @override
  _CustomButtonHeartState createState() => _CustomButtonHeartState();
}

class _CustomButtonHeartState extends State<CustomButtonHeart> {
  bool _pressed = false;

  void _onPressed() {
    setState(() {
      _pressed = !_pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Heart Demo')),
      body: const Center(
        child: ButtonHeart(true, 32),
      ),
    );
  }
}

class CustomSearchbarFilter extends StatefulWidget {
  @override
  _CustomSearchbarFilterState createState() => _CustomSearchbarFilterState();
}

class _CustomSearchbarFilterState extends State<CustomSearchbarFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Bar Filter Demo')),
      body: Center(
        child: SearchBarFilter(),
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
