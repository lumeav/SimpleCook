import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simple_cook/common/theme.dart';

class LoadingIndicator extends StatelessWidget {

  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.3;
    return Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                strokeWidth: 6,
              ),
            ),
            PhosphorIcon(
              PhosphorIcons.chefHat(PhosphorIconsStyle.regular),
                color: SimpleCookColors.primary,
                size: size - 50,),
          ],
    ));
  }
}
