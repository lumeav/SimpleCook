import 'dart:convert';

SingleRecipe singleRecipeFromJson(String str) =>
    SingleRecipe.fromJson(json.decode(str));

String singleRecipeToJson(SingleRecipe data) => json.encode(data.toJson());

class SingleRecipe {
  List<String>? diet;
  List<String> imageUrls;
  List<Ingredient> ingredients;
  int portions;
  String? source;
  List<String> steps;
  String title;
  double totalTime;

  SingleRecipe({
    required this.diet,
    required this.imageUrls,
    required this.ingredients,
    required this.portions,
    required this.source,
    required this.steps,
    required this.title,
    required this.totalTime,
  });

  factory SingleRecipe.fromJson(Map<String, dynamic> json) => SingleRecipe(
        diet: json["diet"] == null
            ? <String>[]
            : List<String>.from(json["diet"].map((x) => x)),
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        ingredients: (json['ingredients'] as List)
          .map((e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
        portions: json["portions"],
        source: json["source"],
        steps: List<String>.from(json["steps"].map((x) => x)),
        title: json["title"],
        totalTime: json["totalTime"] > 200 ? json["totalTime"] / 60 : json["totalTime"],
      );

  Map<String, dynamic> toJson() => {
        "diet": diet == null ? [] : List<dynamic>.from(diet!.map((String x) => x)),
        "image_urls": List<dynamic>.from(imageUrls.map((String x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((Ingredient x) => x.toJson())),
        "portions": portions,
        "source": source,
        "steps": List<dynamic>.from(steps.map((String x) => x)),
        "title": title,
        "totalTime": totalTime,
      };

  factory SingleRecipe.genRecipeFromJson(Map<String, dynamic> json) => SingleRecipe(
        diet: [],
        imageUrls: [],
        ingredients: (json['ingredients'] as List)
          .map((e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
        portions: json["portions"],
        source: "",
        steps: List<String>.from(json["instructions"].map((x) => x)),
        title: json["title"],
        totalTime: json["totalTime"] > 200 ? json["totalTime"] / 60 : json["totalTime"],
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
        amount: json["amount"].toString(),
        name: json["name"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "name": name,
        "unit": unit,
      };
}