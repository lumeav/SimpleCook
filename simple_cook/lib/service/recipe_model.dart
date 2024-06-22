
import 'dart:convert';

List<Recipe> recipeFromJson(String str) => List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
    String? difficulty;
    List<String> imageUrls;
    List<Ingredient> ingredients;
    Nutrition? nutrition;
    int portions;
    Rating rating;
    String source;
    SourceUrl sourceUrl;
    String title;
    double totalTime;
    List<String>? diet;
    String? keywords;

    Recipe({
        this.difficulty,
        required this.imageUrls,
        required this.ingredients,
        this.nutrition,
        required this.portions,
        required this.rating,
        required this.source,
        required this.sourceUrl,
        required this.title,
        required this.totalTime,
        this.diet,
        this.keywords,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        difficulty: json["difficulty"],
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        nutrition: json["nutrition"] == null ? null : Nutrition.fromJson(json["nutrition"]),
        portions: json["portions"],
        rating: Rating.fromJson(json["rating"]),
        source: json["source"],
        sourceUrl: sourceUrlValues.map[json["source_url"]]!,
        title: json["title"],
        totalTime: json["totalTime"],
        diet: json["diet"] == null ? [] : List<String>.from(json["diet"]!.map((x) => x)),
        keywords: json["keywords"],
    );

    Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "nutrition": nutrition?.toJson(),
        "portions": portions,
        "rating": rating.toJson(),
        "source": source,
        "source_url": sourceUrlValues.reverse[sourceUrl],
        "title": title,
        "totalTime": totalTime,
        "diet": diet == null ? [] : List<dynamic>.from(diet!.map((x) => x)),
        "keywords": keywords,
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

class Nutrition {
    int? kcal;

    Nutrition({
        required this.kcal,
    });

    factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        kcal: json["kcal"],
    );

    Map<String, dynamic> toJson() => {
        "kcal": kcal,
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

enum SourceUrl {
    BRIGITTE_DE,
    LECKER_DE
}

final sourceUrlValues = EnumValues({
    "brigitte.de": SourceUrl.BRIGITTE_DE,
    "lecker.de": SourceUrl.LECKER_DE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}


