import 'package:hive/hive.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class SingleRecipeAdapter extends TypeAdapter<SingleRecipe> {
  @override
  final int typeId = 0; // Unique identifier for this type in Hive

  @override
  SingleRecipe read(BinaryReader reader) {
    var map = reader.readMap();
    Map<String, dynamic> json =
        map.cast<String, dynamic>(); // Ensure type casting
    return SingleRecipe.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, SingleRecipe obj) {
    // Serialize SingleRecipe object to bytes
    writer.writeMap(obj.toJson());
  }
}

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 1; // Unique identifier for this type in Hive

  @override
  Ingredient read(BinaryReader reader) {
    var map = reader.readMap();
    Map<String, dynamic> json = map.cast<String, dynamic>();
    return Ingredient.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer.writeMap(obj.toJson());
  }
}

