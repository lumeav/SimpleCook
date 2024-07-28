import 'dart:convert';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  List<String> imageUrls;
  List<Ingredient> ingredients;
  int? portions;
  String source;
  String title;
  double totalTime;
  List<String>? diet;

  Recipe({
    required this.imageUrls,
    required this.ingredients,
    required this.portions,
    required this.source,
    required this.title,
    required this.totalTime,
    this.diet,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        ingredients: (json['ingredients'] as List)
            .map(
                (e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        portions: json["portions"],
        source: json["source"],
        title: json["title"],
        totalTime: json["totalTime"],
        diet: json["diet"] == null
            ? []
            : List<String>.from(json["diet"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "source": source,
        "title": title,
        "totalTime": totalTime,
        "diet": diet == null ? [] : List<dynamic>.from(diet!.map((x) => x)),
      };
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
        amount: json["amount"],
        name: json["name"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "name": name,
        "unit": unit,
      };
}

class Rating {
  int? ratingCount;
  double? ratingValue;

  Rating({
    required this.ratingCount,
    required this.ratingValue,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        ratingCount: json["ratingCount"],
        ratingValue: json["ratingValue"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ratingCount": ratingCount,
        "ratingValue": ratingValue,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
