import 'dart:convert';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from((json.decode(str) as List<dynamic>).map((x) => Recipe.fromJson(x as Map<String, dynamic>)));

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
        imageUrls: List<String>.from((json["image_urls"] as List<dynamic>).map((x) => x as String)),
        ingredients: (json['ingredients'] as List)
            .map(
                (e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        portions: json["portions"] as int?,
        source: json["source"] as String,
        title: json["title"] as String,
        totalTime: json["totalTime"] as double,
        diet: json["diet"] == null
            ? []
            : List<String>.from((json["diet"] as List<dynamic>).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image_urls": List<dynamic>.from(imageUrls.map((String x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((Ingredient x) => x.toJson())),
        "source": source,
        "title": title,
        "totalTime": totalTime,
        "diet": diet == null ? [] : List<dynamic>.from(diet!.map((String x) => x)),
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
        amount: json["amount"] as String,
        name: json["name"] as String,
        unit: json["unit"] as String,
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
        ratingCount: json["ratingCount"] as int,
        ratingValue: json["ratingValue"] as double,
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
