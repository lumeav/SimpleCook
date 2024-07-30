import 'package:flutter/material.dart';
import 'dart:math';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simple_cook/common/constants.dart';
import 'package:simple_cook/common/theme.dart';
import 'package:simple_cook/common/config.dart';

class LoadingIndicator extends StatelessWidget {
  final bool showTips;

  const LoadingIndicator({super.key, this.showTips = false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * SimpleCookRatios.loadingIndicatorRatio;
    String randomTip = Config.tips[Random().nextInt(Config.tips.length)];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size,
                width: size,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(SimpleCookColors.primary),
                  strokeWidth: 4,
                ),
              ),
              PhosphorIcon(
                PhosphorIcons.chefHat(PhosphorIconsStyle.light),
                color: SimpleCookColors.primary,
                size: size - 50,
              ),
            ],
          ),
          if (showTips)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: Text(
                  randomTip,
                  style: SimpleCookTextstyles.easterEgg,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
