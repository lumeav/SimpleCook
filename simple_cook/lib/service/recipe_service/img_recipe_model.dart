import 'dart:convert';

ImgRecipeModel imgRecipeFromJson(String str) => ImgRecipeModel.fromJson(json.decode(str));

String imgRecipeToJson(ImgRecipeModel data) => json.encode(data.toJson());

class ImgRecipeModel {
    List<Ingredient> ingredients;
    List<String> steps;
    String title;
    String? imageSize;

    ImgRecipeModel({
        required this.ingredients,
        required this.steps,
        required this.title,
        required this.imageSize,
    });

    factory ImgRecipeModel.fromJson(Map<String, dynamic> json) => ImgRecipeModel(
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        steps: List<String>.from(json["instructions"].map((x) => x)),
        title: json["title"],
        imageSize: json["image_size"] ?? '256x256',
    );

    Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "title": title,
        "image_size": '256x256',
    };
}

class Ingredient {
    String? amount;
    String name;
    String? unit;

    Ingredient({
        required this.amount,
        required this.name,
        required this.unit,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        amount: json["amount"]?.toString(),
        name: json["name"],
        unit: json["unit"]?.toString(),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount == null ? "" : amount.toString(),
        "name": name,
        "unit": unit == null ? "" : unit,
    };
}
