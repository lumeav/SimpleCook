import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/common/custom_navbar.dart';
import 'package:simple_cook/service/navigation_service/navigation_service.dart';


class MainWrapper extends ConsumerWidget {
  final StatefulNavigationShell child;

  const MainWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool test = ref.watch(testProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavBar(child: child)
    );

  }
}