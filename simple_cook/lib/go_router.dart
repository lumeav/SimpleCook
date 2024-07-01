import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';
import 'package:simple_cook/ui/recipe_finder/result/result_view.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_view.dart';
// To test:
import 'package:simple_cook/ui/recipe_info/recipe_info_view.dart';
import 'package:simple_cook/wrapper/main_wrapper.dart';

final GoRouter router = GoRouter(initialLocation: '/explore', routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapper(
          key: state.pageKey,
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/explore',
              name: 'explore',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: ExploreView(
                    key: state.pageKey,
                  ),
                );
              },
              routes: [
                GoRoute(
                    path: 'subRecipesFiltered',
                    name: 'subRecipesFiltered',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                          key: state.pageKey,
                          child: ExploreFilteredView(
                            key: state.pageKey,
                            search: state.uri.queryParameters['search'],
                          ));
                    })
              ]),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/recipeFinder',
              name: 'recipeFinder',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: RecipefinderView(
                    key: state.pageKey,
                  ),
                );
              })
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/favorites',
              name: 'favorites',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: FavoritesView(
                    key: state.pageKey,
                  ),
                );
              })
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/planner',
              name: 'planner',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: PlannerView(
                    key: state.pageKey,
                  ),
                );
              })
        ])
      ]),
  GoRoute(
    path: '/singleRecipeView',
    name: 'singleRecipeView',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: RecipeView(
          key: state.pageKey,
          recipeUrl: state.uri.queryParameters['recipeUrl'],
          difficulty: state.uri.queryParameters['difficulty'],
        ),
      );
    },
  ),
  GoRoute(
    path: '/singleResultView',
    name: 'singleResultView',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: ResultView(
          key: state.pageKey,
          text: state.uri.queryParameters['text'],
        ),
      );
    },
  )
]);
