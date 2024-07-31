import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_cook/service/recipe_service/single_recipe_model.dart';
import 'package:simple_cook/ui/explore/explore_view.dart';
import 'package:simple_cook/ui/favorites/favorites_view.dart';
import 'package:simple_cook/ui/planner/planner_view.dart';
import 'package:simple_cook/ui/recipe_finder/recipe_finder_view.dart';
import 'package:simple_cook/ui/explore/explore_filtered/explore_filtered_view.dart';
import 'package:simple_cook/ui/recipe_info/recipe_info_view.dart';
import 'package:simple_cook/wrapper/main_wrapper.dart';

final GoRouter router = GoRouter(initialLocation: '/explore', routes: <RouteBase>[
  StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return MainWrapper(
          key: state.pageKey,
          child: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
              path: '/explore',
              name: 'explore',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage<dynamic>(
                  key: state.pageKey,
                  child: ExploreView(
                    key: state.pageKey,
                  ),
                );
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'subRecipesFiltered',
                    name: 'subRecipesFiltered',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return NoTransitionPage<dynamic>(
                          key: state.pageKey,
                          child: ExploreFilteredView(
                            key: state.pageKey,
                            search: state.uri.queryParameters['search'],
                          ));
                    })
              ]),
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
              path: '/recipeFinder',
              name: 'recipeFinder',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage<dynamic>(
                  key: state.pageKey,
                  child: RecipefinderView(
                    key: state.pageKey,
                  ),
                );
              })
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
              path: '/favorites',
              name: 'favorites',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage<dynamic>(
                  key: state.pageKey,
                  child: FavoritesView(
                    key: state.pageKey,
                  ),
                );
              })
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
              path: '/planner',
              name: 'planner',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage<dynamic>(
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
    pageBuilder: (BuildContext context, GoRouterState state) {
      SingleRecipe? genRecipe = state.extra as SingleRecipe?;
      return NoTransitionPage<dynamic>(
        key: state.pageKey,
        child: RecipeView(
          key: state.pageKey,
          recipeUrl: state.uri.queryParameters['recipeUrl'],
          genRecipeQuery: state.uri.queryParameters['genRecipeQuery'],
          genRecipe: genRecipe,
        ),
      );
    },
  ),
]);
