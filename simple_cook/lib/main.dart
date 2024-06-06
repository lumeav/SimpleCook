import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/widgets/navbar.dart';
import 'package:simple_cook/widgets/img.dart';
import 'package:simple_cook/widgets/wochenplanerRecipe.dart';
import 'package:simple_cook/widgets/whitePlaceholder.dart';
import 'package:simple_cook/widgets/minusIcon.dart';
import 'package:simple_cook/widgets/AddPlaner.dart';
import 'package:simple_cook/widgets/ButtonClose.dart';
import 'widgets/appBar.dart';

//This is main_dummy.dart to test widgets using dummy data. It is currently named "main.dart" to ensure starting this after starting the application

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('de_DE', null);
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
                MaterialPageRoute(builder: (context) => CustomPortionSize()),
              );
            },
          ),
          ListTile(
            title: Text('Img'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPic()),
              );
            },
          ),
          ListTile(
            title: Text('WochenplanerRecipe'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomWochenplanerRecipe()),
              );
            },
          ),
          ListTile(
            title: Text('WhitePlaceholder'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomWhitePlaceholder()),
              );
            },
          ),
          ListTile(
            title: Text('CustomNavBar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomNavBarDemo()),
              );
            },
          ),
          ListTile(
            title: Text('MinusIcon'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomMinusIcon()),
              );
            },
          ),
          ListTile(
            title: Text('AddPlaner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomAddPlaner()),
              );
            },
          ),
          ListTile(
            title: Text('CloseButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomButtonClose()),
              );
            },
          ),
          ListTile(
            title: Text('Ingredients'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomIngredients()),
              );
            },
          ),
          ListTile(
            title: Text('Preparation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPreparation()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButtonClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          'Close Button'), // Assuming you want to use the custom app bar
      body: Center(
        child: ButtonClose(), // Add the AddPlaner widget here
      ),
    );
  }
}

class CustomAddPlaner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          'Add Planer'), // Assuming you want to use the custom app bar
      body: Center(
        child: AddPlaner(), // Add the AddPlaner widget here
      ),
    );
  }
}

class CustomWhitePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('SimpleCook'),
        backgroundColor: Colors.grey[300],
        body: Stack(children: [
          WhitePlaceholder(85),
          Align(alignment: Alignment.center, child: SearchBarFilter())
        ]));
  }
}

class CustomWochenplanerRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wochenplaner Recipe Demo')),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: WochenplanerRecipe('assets/spaghetti-bolognese.jpg',
            'Spaghetti Bolognese', '30min', 'einfach'),
      ),
    );
  }
}

class CustomPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Img Demo')),
      body: Center(
        child: Img('assets/flammkuchen.jpg', 352, 189),
      ),
    );
  }
}

class CustomPreparation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Preparation Demo')),
        body: Center(
            child: Preparation([
          "Die Zwiebeln schälen, halbieren und in Würfel schneiden.",
          "In einem großen Topf das Olivenöl erhitzen und die Zwiebeln darin anschwitzen, bis sie glasig sind. Die Tomaten würfeln und zu den Zwiebeln geben.",
          "Hühnerbrühe, Hähnchenbrust, braunen Zucker, Chipotle-Chili und Lorbeerblätter hinzufügen. Alles gut verrühren und für 30 Minuten auf mittlerer Hitze köcheln lassen, bis die Hähnchenbrust gar ist und die Flüssigkeit um die Hälfte reduziert wurde.",
          "Den Topf vom Herd nehmen und leicht abkühlen lassen. Anschließend das Hähnchenfleisch mit zwei Gabeln zerpflücken.",
          "Die Lorbeerblätter entfernen.",
          "Jede Tostada großzügig mit der Tinga-Mischung belegen. Die roten Zwiebeln in feine Würfel schneiden und zusammen mit dem Panela-Käse über die Tostadas zerbröseln. Nach Belieben mit Korianderblättern garnieren und mit Limettenspalten servieren."
        ])));
  }
}

class CustomIngredients extends StatefulWidget {
  @override
  _CustomIngredientsState createState() => _CustomIngredientsState();
}

class _CustomIngredientsState extends State<CustomIngredients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingredients Demo')),
      body: Center(
        child: Ingredients([
          "150g Zwiebel",
          "20ml Olivenöl",
          "250g Tomate",
          "500ml Hühnerbrühe",
          "500g Hähnchenbrust",
          "15g Zucker (braun)",
          "10g Chili Chipotle (geräucherte Chili)",
          "1 Lorbeerblatt",
          "9 mexikanische Tostadas",
          "100g Panela-Käse"
        ]),
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
      body: Center(child: WhiteBackground()),
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
        backgroundColor: Colors.grey[300],
        body: const Column(children: [
          RezeptdesTages(
              'assets/spaghetti-bolognese.jpg', 'Spaghetti Bolognese'),
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
      backgroundColor: Colors.grey[300],
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

class CustomNavBarDemo extends StatefulWidget {
  @override
  _CustomNavBarDemoState createState() => _CustomNavBarDemoState();
}

class _CustomNavBarDemoState extends State<CustomNavBarDemo> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('SimpleCook'),
      body: Center(
        child: Text(
            'This is a custom Bottom Navigation Bar. Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
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

class CustomMinusIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minus Icon Demo')),
      body: Center(
        child: minusIcon(),
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
