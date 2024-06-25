import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/persistence_service.dart';
import 'package:simple_cook/service/single_recipe_model.dart';

class HeartButton extends ConsumerStatefulWidget {
  final bool border;
  final SingleRecipe recipe;

  const HeartButton(this.border, {required this.recipe, super.key});

  @override
  ConsumerState<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends ConsumerState<HeartButton> {
  bool _pressed = false;
  final persistenceService = PersistenceService();

  @override
  void initState() {
    super.initState();
    _pressed = persistenceService.isFavorite(widget.recipe);
  }

  void _onPressed() {
    setState(() {
      _pressed = !_pressed;
    });
    if (_pressed) {
      persistenceService.addFavorite(widget.recipe);
    } else {
      persistenceService.removeFavorite(widget.recipe);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    var size = MediaQuery.of(context).size.width * 0.07;
    if (!widget.border) {
      size = size + 22;
    }
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: widget.border
          ? const BoxDecoration(shape: BoxShape.circle, color: Colors.white)
          : null,
      child: IconButton(
          onPressed: _onPressed,
          padding: EdgeInsets.zero,
          icon: Icon(_pressed ? Icons.favorite : Icons.favorite_border,
              color: SimpleCookColors.primary, size: size)),
    );
  }
}
