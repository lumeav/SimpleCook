import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/wrapper/widgets/custom_navbar.dart';

class MainWrapper extends ConsumerWidget {
  final StatefulNavigationShell child;

  const MainWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavBar(child: child)
    );

  }
}