import 'dart:convert';

GenRecipe genRecipeFromJson(String str) => GenRecipe.fromJson(json.decode(str));

String genRecipeToJson(GenRecipe data) => json.encode(data.toJson());

class GenRecipe {
    List<Ingredient> ingredients;
    List<String> instructions;
    int portions;
    String title;
    double totalTime;
    String? imgUrl;

    GenRecipe({
        required this.ingredients,
        required this.instructions,
        required this.portions,
        required this.title,
        required this.totalTime,
        required this.imgUrl,
    });

    factory GenRecipe.fromJson(Map<String, dynamic> json) => GenRecipe(
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        portions: json["portions"],
        title: json["title"],
        totalTime: json["totalTime"] / 60,  //divide trough 60 and cast to int,
        imgUrl: json["imgUrl"],
    );

    Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "portions": portions,
        "title": title,
        "totalTime": totalTime,
        "imgUrl": imgUrl,
    };
}

class Ingredient {
    String name;
    int? amount;
    String? unit;

    Ingredient({
        required this.name,
        this.amount,
        this.unit,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        amount: json["amount"] == null ? (json["amount"] is int ? json["amount"].toDouble() : json["amount"]) : null,
        unit: json["unit"] == null ? "" : json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": name == null ? "" : amount,
        "unit": unit == null ? "" : unit,
    };
}