import 'dart:convert';

GenRecipeModel genRecipeFromJson(String str) => GenRecipeModel.fromJson(json.decode(str));

String genRecipeToJson(GenRecipeModel data) => json.encode(data.toJson());

class GenRecipeModel {
    List<Ingredient> ingredients;
    List<String> instructions;
    int portions;
    String title;
    double totalTime;
    String? imgUrl;

    GenRecipeModel({
        required this.ingredients,
        required this.instructions,
        required this.portions,
        required this.title,
        required this.totalTime,
        required this.imgUrl,
    });

    factory GenRecipeModel.fromJson(Map<String, dynamic> json) => GenRecipeModel(
        ingredients:(json['ingredients'] as List)
          .map((e) => Ingredient.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        portions: json["portions"],
        title: json["title"],
        totalTime: json["totalTime"] > 200 ? json["totalTime"] / 60 : json["totalTime"],
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
    double? amount;
    String? unit;

    Ingredient({
        required this.name,
        this.amount,
        this.unit,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        amount: json["amount"] != null ? json["amount"].toDouble() : null,
        unit: json["unit"] == null ? "" : json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": name == null ? "" : amount,
        "unit": unit == null ? "" : unit,
    };
}