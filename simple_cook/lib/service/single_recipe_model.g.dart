// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleRecipeImpl _$$SingleRecipeImplFromJson(Map<String, dynamic> json) =>
    _$SingleRecipeImpl(
      diet: (json['diet'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image_urls:
          (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      portions: (json['portions'] as num).toInt(),
      source: json['source'] as String,
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      totalTime: (json['totalTime'] as num).toDouble(),
    );

Map<String, dynamic> _$$SingleRecipeImplToJson(_$SingleRecipeImpl instance) =>
    <String, dynamic>{
      'diet': instance.diet,
      'image_urls': instance.image_urls,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'portions': instance.portions,
      'source': instance.source,
      'steps': instance.steps,
      'title': instance.title,
      'totalTime': instance.totalTime,
    };

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      amount: json['amount'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'name': instance.name,
      'unit': instance.unit,
    };
