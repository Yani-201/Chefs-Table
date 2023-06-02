<<<<<<< HEAD
import 'package:chefs_table/recipe/blocs/blocs.dart';
import 'package:chefs_table/recipe/models/recipeUpdateDto.dart';
import 'package:chefs_table/review/models/review.dart';

import '../data_providers/recipe_data_provider.dart';
import '../models/recipe.dart';

class RecipeRepository {
  final RecipeDataProvider dataProvider;
  RecipeRepository(this.dataProvider);

  Future<Recipe> create(Recipe recipe) async {
    return dataProvider.create(recipe);
  }

  Future<Recipe> update(int id, RecipeUpdateDto update) async {
    return dataProvider.update(id, update);
  }

  Future<List<Recipe>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    return dataProvider.delete(id);
  }

  Future<List<Review>> getReviews(int id) async {
    return dataProvider.getReviews(id);
  }
}
=======
import 'package:chefs_table/recipe/blocs/blocs.dart';
import 'package:chefs_table/recipe/models/recipeUpdateDto.dart';
import 'package:chefs_table/review/models/review.dart';

import '../data_providers/recipe_data_provider.dart';
import '../models/recipe.dart';

class RecipeRepository {
  final RecipeDataProvider dataProvider;
  RecipeRepository(this.dataProvider);

  Future<Recipe> create(Recipe recipe) async {
    return dataProvider.create(recipe);
  }

  Future<Recipe> update(int id, RecipeUpdateDto update) async {
    return dataProvider.update(id, update);
  }

  Future<List<Recipe>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    return dataProvider.delete(id);
  }

  Future<List<Review>> getReviews(int id) async {
    return dataProvider.getReviews(id);
  }
}
>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
