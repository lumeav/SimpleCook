import 'dart:convert';

SingleRecipe singleRecipeFromJson(String str) => SingleRecipe.fromJson(json.decode(str) as Map<String, dynamic>);

String singleRecipeToJson(SingleRecipe data) => json.encode(data.toJson());

class SingleRecipe {
  List<String> imageUrls;
  List<Ingredient> ingredients;
  int portions;
  String? source;
  List<String> steps;
  String title;
  double totalTime;

  SingleRecipe({
    required this.imageUrls,
    required this.ingredients,
    required this.portions,
    required this.source,
    required this.steps,
    required this.title,
    required this.totalTime,
  });

  factory SingleRecipe.fromJson(Map<String, dynamic> json) => SingleRecipe(
        imageUrls: List<String>.from((json["image_urls"] as List<dynamic>).map((x) => x)),
        ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
        portions: json["portions"] as int,
        source: json["source"] as String,
        steps: List<String>.from((json["steps"] as List<dynamic>).map((x) => x)),
        title: json["title"] as String,
        totalTime: (json["totalTime"] as double > 200) ? (json["totalTime"] / 60) as double : json["totalTime"] as double,
      );

  Map<String, dynamic> toJson() => {
        "image_urls": List<dynamic>.from(imageUrls.map((String x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((Ingredient x) => x.toJson())),
        "portions": portions,
        "source": source,
        "steps": List<dynamic>.from(steps.map((String x) => x)),
        "title": title,
        "totalTime": totalTime,
      };

  factory SingleRecipe.genRecipeFromJson(Map<String, dynamic> json) => SingleRecipe(
        imageUrls: [],
        ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
        portions: json["portions"] as int,
        source: "",
        steps: List<String>.from((json["instructions"] as List<dynamic>).map((x) => x)),
        title: json["title"] as String,
        totalTime: (json["totalTime"] as double > 200) ? (json["totalTime"] / 60) as double : json["totalTime"] as double,
      );
}


class Ingredient {
  String amount;
  String name;
  String unit;

  Ingredient({
    required this.amount,
    required this.name,
    required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        amount: json["amount"].toString().split('.').first,
        name: json["name"] as String,
        unit: json["unit"] as String,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "name": name,
        "unit": unit,
      };
}