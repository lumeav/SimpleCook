import 'package:flutter/material.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/ui/favorites/favorites_controller.dart';

class HeartButton extends ConsumerStatefulWidget {
  final bool border;

  const HeartButton(
    this.border,{
    super.key,
  });

  @override
  ConsumerState<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends ConsumerState<HeartButton> {
  bool _pressed = false;

  void _onPressed() {
    setState(() {
      _pressed = !_pressed;
    });
    if (_pressed) {
      ref.read(favoritesControllerProvider.notifier).addMockRecipe();
    } else {
      ref.read(favoritesControllerProvider.notifier).removeMockRecipe();
    }
  }

  @override
  Widget build(BuildContext context, ) {
    final favoritesRecipes = ref.watch(favoritesControllerProvider);

    var size = MediaQuery.of(context).size.width * 0.07;
    if (!widget.border) {
      size = size + 22;
    }
    return Container(
      width: size + 8,
      height:  size + 8,
      decoration: widget.border
          ? const BoxDecoration(shape: BoxShape.circle, color: Colors.white)
          : null,
      child: IconButton(
          onPressed: _onPressed,
          padding: EdgeInsets.zero,
          icon: Icon(_pressed ? Icons.favorite : Icons.favorite_border,
              color: SimpleCookColors.primary, size: size )),
    );
  }
}
