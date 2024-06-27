import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/recipefinder/recipefinder_view.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/ui/recipegen/recipe_gen_view.dart';
import 'package:simple_cook/ui/recipesFiltered/recipesFiltered_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
// To test:
import 'package:simple_cook/ui/recipe/recipe_view.dart';
import 'package:simple_cook/widgets/header_recipe_infos.dart';
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
                  path: 'subRecipeView',
                  name: 'subRecipeView',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey,
                        child: RecipeView(
                          key: state.pageKey,
                          recipeUrl: state.uri.queryParameters['recipeUrl'],
                          difficulty: state.uri.queryParameters['difficulty'],
                        ));
                  },
                ),
                GoRoute(
                  path: 'subRecipesFiltered',
                  name: 'subRecipesFiltered',
                  pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey,
                      child: RecipesFilteredView(
                        key: state.pageKey,
                        search: state.uri.queryParameters['search'],
                        ));
                },
                routes: [GoRoute(
                  path: 'subRecipeView1',
                  name: 'subRecipeView1',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey,
                        child: RecipeView(
                          recipeUrl: state.uri.queryParameters['recipeUrl'],
                          difficulty: state.uri.queryParameters['difficulty'],
                        ));
                  },
                ),
                ])
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
              },
              routes: [
                GoRoute(
                  path: 'subGenRecipeView',
                  name: 'subGenRecipeView',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      key: state.pageKey,
                      child: RecipeGenView(
                        key: state.pageKey,
                        text: state.uri.queryParameters['text'],
                      ),
                    );
                  },
                ),
              ])
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
              },
              routes: [
                GoRoute(
                  path: 'subRecipeView2',
                  name: 'subRecipeView2',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey,
                        child: RecipeView(
                          recipeUrl: state.uri.queryParameters['recipeUrl'],
                          difficulty: state.uri.queryParameters['difficulty'],
                        ));
                  },
                )
              ])
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
              },
              routes: [
                GoRoute(
                  path: 'subRecipeView3',
                  name: 'subRecipeView3',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey,
                        child: RecipeView(
                          recipeUrl: state.uri.queryParameters['recipeUrl'],
                          difficulty: state.uri.queryParameters['difficulty'],
                        ));
                  },
                )
              ])
        ])
      ])
]);
