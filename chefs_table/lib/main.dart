import 'package:chefs_table/home.dart';
import 'package:chefs_table/landing.dart';
import 'package:chefs_table/login.dart';
import 'package:chefs_table/profile.dart';
import 'package:chefs_table/recipe/bloc_observer.dart';
import 'package:chefs_table/recipe/blocs/blocs.dart';
import 'package:chefs_table/recipe/data_providers/recipe_data_provider.dart';
import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:chefs_table/recipe/repository/recipe_repository.dart';
import 'package:chefs_table/recipe/screens/recipe_delete.dart';
import 'package:chefs_table/recipe/screens/recipe_update.dart';
import 'package:chefs_table/recipe/screens/recipes_list.dart';
import 'package:chefs_table/recipe/screens/recipieCreate.dart';
import 'package:chefs_table/recipe/screens/recipies.dart';
import 'package:chefs_table/restaurant/blocs/blocs.dart';
import 'package:chefs_table/restaurant/data_providers/restaurant_data_provider.dart';
import 'package:chefs_table/restaurant/models/restaurant.dart';
import 'package:chefs_table/restaurant/repository/restaurant_repository.dart';
import 'package:chefs_table/restaurant/screens/restaurant_create.dart';
import 'package:chefs_table/restaurant/screens/restaurant_detail.dart';
import 'package:chefs_table/restaurant/screens/restaurant_list.dart';
import 'package:chefs_table/restaurant/screens/restaurant_update.dart';
import 'package:chefs_table/restaurant/screens/restaurat_delete.dart';
import 'package:chefs_table/signup.dart';
import 'package:chefs_table/user/blocs/blocs.dart';
import 'package:chefs_table/user/blocs/user_event.dart';
import 'package:chefs_table/user/data_providers/user_data_providers.dart';
import 'package:chefs_table/user/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

// final _router = GoRouter(routes: [
//   GoRoute(path: '/', builder: (context, state) => home1(), routes: [
//     GoRoute(path: 'recipeDetail', builder: (context, state) => Recipies())
//   ]),
// ]);

class MyApp extends StatelessWidget {
  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder: ((context, state) => LandingPage())),
    GoRoute(path: '/home', builder: ((context, state) => const Home())),
    GoRoute(
        path: '/recipeDetail',
        builder: ((context, state) => Recipes(recipe: state.extra as Recipe))),
    GoRoute(
        path: '/deleteRecipe',
        builder: ((context, state) =>
            RecipeRemove(recipe: state.extra as Recipe))),
    GoRoute(
        path: '/editRecipe',
        builder: ((context, state) =>
            RecipeEdit(update: state.extra as Recipe))),
    GoRoute(path: '/recipe', builder: ((context, state) => const RecipeList())),
    GoRoute(
        path: '/createRecipe',
        builder: ((context, state) => RecipeCreationPage())),
    GoRoute(
        path: '/restaurantDetail',
        builder: ((context, state) =>
            RestaurantDetail(restaurant: state.extra as Restaurant))),
    GoRoute(
        path: '/restaurant',
        builder: ((context, state) => const RestaurantList())),
    GoRoute(
        path: '/createRestaurant',
        builder: ((context, state) => const CreateRestaurant())),
    GoRoute(
        path: '/editRestaurant',
        builder: ((context, state) =>
            EditRestaurant(restaurant: state.extra as Restaurant))),
    GoRoute(
        path: '/deleteRestaurant',
        builder: ((context, state) =>
            DeleteRestaurant(restaurant: state.extra as Restaurant))),
    GoRoute(path: '/login', builder: ((context, state) => login())),
    GoRoute(path: '/signup', builder: ((context, state) => SignUpForm())),
    // GoRoute(path: '/profile', builder: ((context, state) => const Profile()))
  ]);
  MyApp({super.key});

  // final _router = GoRouter(routes: [
  //   GoRoute(path: '/', builder: ((context, state) => const Home())),
  //   GoRoute(path: '/recipeDetail', builder: ((context, state) => Recipies())),
  //   GoRoute(path: '/recipe', builder: ((context, state) => RecipeList())),
  //   GoRoute(
  //       path: '/restaurantDetail',
  //       builder: ((context, state) => restaurant_detail())),
  //   GoRoute(
  //       path: '/restaurant', builder: ((context, state) => const restaurant())),
  // ]);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(UserDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => RecipeRepository(RecipeDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => RestaurantRepository(RestaurantDataProvider()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider(
            create: (context) => RecipeBloc(
                recipeRepository:
                    RepositoryProvider.of<RecipeRepository>(context))
              ..add(const RecipeLoad()),
          ),
          BlocProvider(
            create: (context) => RestaurantBloc(
                restaurantRepository:
                    RepositoryProvider.of<RestaurantRepository>(context))
              ..add(const RestaurantLoad()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Recipe App',
          routerConfig: _router,
          theme:
              ThemeData(primaryColor: (const Color.fromARGB(255, 41, 30, 69))),
        ),
      ),
    );
    // return RepositoryProvider(create: RecipeRepository(RecipeDataProvider()),)
    // const MaterialApp(
    //   home: RecipeList(),
    //   // );
    //   // return MaterialApp.router(
    //   //   debugShowCheckedModeBanner: false,
    //   //   routerConfig: _router,
    //   // );
    // );
  }
}
