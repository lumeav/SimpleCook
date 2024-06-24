import 'dart:convert';

SingleRecipe singleRecipeModelFromJson(String str) => SingleRecipe.fromJson(json.decode(str));

String singleRecipeModelToJson(SingleRecipe data) => json.encode(data.toJson());

class SingleRecipe {
    List<String> imageUrls;
    List<Ingredient> ingredients;
    String keywords;
    int portions;
    String source;
    List<String> steps;
    String title;
    double totalTime;

    SingleRecipe({
        required this.imageUrls,
        required this.ingredients,
        required this.keywords,
        required this.portions,
        required this.source,
        required this.steps,
        required this.title,
        required this.totalTime,
    });

    factory SingleRecipe.fromJson(Map<String, dynamic> json) => SingleRecipe(
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        keywords: json["keywords"],
        portions: json["portions"],
        source: json["source"],
        steps: List<String>.from(json["steps"].map((x) => x)),
        title: json["title"],
        totalTime: json["totalTime"],
    );

    Map<String, dynamic> toJson() => {
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "keywords": keywords,
        "portions": portions,
        "source": source,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "title": title,
        "totalTime": totalTime / 60,
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
