import 'dart:convert';

ImgRecipe imgRecipeFromJson(String str) => ImgRecipe.fromJson(json.decode(str));

String imgRecipeToJson(ImgRecipe data) => json.encode(data.toJson());

class ImgRecipe {
    List<Ingredient> ingredients;
    List<String> steps;
    String title;
    String? imageSize;

    ImgRecipe({
        required this.ingredients,
        required this.steps,
        required this.title,
        required this.imageSize,
    });

    factory ImgRecipe.fromJson(Map<String, dynamic> json) => ImgRecipe(
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
