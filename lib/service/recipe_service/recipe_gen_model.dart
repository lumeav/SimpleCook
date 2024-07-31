import 'dart:convert';

GenRecipeModel genRecipeFromJson(String str) =>
    GenRecipeModel.fromJson(json.decode(str) as Map<String, dynamic>);

String genRecipeToJson(GenRecipeModel data) => json.encode(data.toJson());

class GenRecipeModel {
  List<GenIngredient> ingredients;
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
        ingredients: (json['ingredients'] as List)
            .map((e) =>
                GenIngredient.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        instructions: List<String>.from(
            (json["instructions"] as List<dynamic>).map((x) => x)),
        portions: json["portions"] as int,
        title: json["title"] as String,
        totalTime: getTotalTime((json["totalTime"] is int)
            ? (json["totalTime"] as int).toDouble()
            : json["totalTime"] as double),
        imgUrl: json["imgUrl"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(
            ingredients.map((GenIngredient x) => x.toJson())),
        "instructions": List<dynamic>.from(instructions.map((String x) => x)),
        "portions": portions,
        "title": title,
        "totalTime": totalTime,
        "imgUrl": imgUrl,
      };

  static double getTotalTime(double totalTime) {
    if (totalTime > 200) {
      return (totalTime / 60).toDouble();
    } else {
      return totalTime.toDouble();
    }
  }
}

class GenIngredient {
  String name;
  double? amount;
  String? unit;

  GenIngredient({
    required this.name,
    this.amount,
    this.unit,
  });

  factory GenIngredient.fromJson(Map<String, dynamic> json) => GenIngredient(
        name: json["name"] as String,
        amount: (json["amount"] is int)
            ? (json["amount"] as int).toDouble()
            : json["amount"] as double,
        unit: json["unit"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unit ?? "",
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenIngredient &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          amount == other.amount &&
          unit == other.unit;

  @override
  int get hashCode =>
      name.hashCode ^ (amount?.hashCode ?? 0) ^ (unit?.hashCode ?? 0);
}
