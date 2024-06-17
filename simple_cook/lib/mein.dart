import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_cook/widgets/filterTag.dart';
import 'package:simple_cook/widgets/sliderFilter.dart';
import 'package:simple_cook/widgets/searchRecipeButton.dart';
import 'package:simple_cook/widgets/filterButton.dart';
import 'package:simple_cook/widgets/heartButton.dart';
import 'package:simple_cook/widgets/recipeInfos.dart';
import 'package:simple_cook/widgets/searchBar.dart';
import 'package:simple_cook/widgets/greyBackground.dart';
import 'package:simple_cook/widgets/ImgAndHeart.dart';
import 'package:simple_cook/widgets/RezeptDesTages.dart';
import 'package:simple_cook/widgets/singleRecipeButton.dart';
import 'package:simple_cook/widgets/whiteBackground.dart';
import 'package:simple_cook/widgets/recipePortion.dart';
import 'package:simple_cook/widgets/ingredients.dart';
import 'package:simple_cook/widgets/preparation.dart';
import 'package:simple_cook/widgets/navBar.dart';
import 'package:simple_cook/widgets/img.dart';
import 'package:simple_cook/widgets/wochenplanerRecipe.dart';
import 'package:simple_cook/widgets/removeButton.dart';
import 'package:simple_cook/widgets/addPlaner.dart';
import 'package:simple_cook/widgets/exitButton.dart';
import 'package:simple_cook/widgets/simpleCookAppBar.dart';
import 'package:simple_cook/widgets/date.dart';
import 'package:simple_cook/widgets/timeViewSpan.dart';

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
            title: Text('SimpleCookAppBar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimpleCookAppBarDemo()),
              );
            },
          ),
          ListTile(
            title: Text('FilterTag'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomFilterTag()),
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
            title: Text('SearchRecipeButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomSearchRecipesButton()),
              );
            },
          ),
          ListTile(
            title: Text('FilterButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomFilterButton()),
              );
            },
          ),
          ListTile(
            title: Text('HeartButton'),
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
            title: Text('SingleRecipeButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomSingleRecipeButton()),
              );
            },
          ),
          ListTile(
            title: Text('WhiteBackground'),
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
            title: Text('NavBar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomNavBarDemo()),
              );
            },
          ),
          ListTile(
            title: Text('RemoveButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomRemoveButton()),
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
            title: Text('ExitButton'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomExitButton()),
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
          ListTile(
            title: Text('Date'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomDate()),
              );
            },
          ),
          ListTile(
            title: Text('TimeViewSpan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomTimeViewSpan()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomTimeViewSpan extends StatefulWidget {
  @override
  _CustomTimeViewSpanState createState() => _CustomTimeViewSpanState();
}

class _CustomTimeViewSpanState extends State<CustomTimeViewSpan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TimeViewSpan Demo')),
      body: Center(
        child: TimeViewSpan(),
      ),
    );
  }
}

class CustomDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar('Date'),
      body: Center(
        child: Date(DateTime(2024, 5, 12)),
      ),
    );
  }
}

class CustomExitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar(
          'Exit Button'), // Assuming you want to use the custom app bar
      body: Center(
        child: ExitButton(), // Add the AddPlaner widget here
      ),
    );
  }
}

class CustomAddPlaner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCookAppBar(
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
        appBar: SimpleCookAppBar('SimpleCook'),
        backgroundColor: Colors.grey[300],
        body: Stack(children: [
          Text("test"),
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
         Text('This is a custom Rezept des Tages widget.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleRecipeButton('assets/tinga-de-pollo.jpg', 'Tinga de Pollo'),
              SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen'),
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
        child: Text('This is a custom Rezept des Tages widget.'),
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
      appBar: SimpleCookAppBar('SimpleCook'),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: GreyBackground([SingleRecipeButton('assets/tinga-de-pollo.jpg', 'Tinga de Pollo'),
              SingleRecipeButton('assets/flammkuchen.jpg', 'Flammkuchen')]),
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
      appBar: SimpleCookAppBar('SimpleCook'),
      body: Center(
        child: Text(
            'This is a custom Bottom Navigation Bar. Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: NavBar(
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
        child: HeartButton(true),
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

class CustomFilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Button Demo')),
      body: Center(
        child: FilterButton(),
      ),
    );
  }
}

class CustomRemoveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Remove Button Demo')),
      body: Center(
        child: RemoveButton(),
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
        child: SliderFilter(),
      ),
    );
  }
}

class SimpleCookAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleCookAppBar('SimpleCook'),
      body: Center(
        child: Text('This is a custom AppBar'),
      ),
    );
  }
}

class CustomFilterTag extends StatefulWidget {
  @override
  _CustomFilterTagState createState() => _CustomFilterTagState();
}

class _CustomFilterTagState extends State<CustomFilterTag> {
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
        child: FilterTag(
          'Vorspeise',
        ),
      ),
    );
  }
}
