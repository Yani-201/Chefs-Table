import 'package:chefs_table/recipe/models/recipeUpdateDto.dart';
import 'package:equatable/equatable.dart';

import '../models/recipe.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();
}

class RecipeLoad extends RecipeEvent {
  const RecipeLoad();

  @override
  List<Object> get props => [];
}

class RecipeCreate extends RecipeEvent {
  final Recipe recipe;

  const RecipeCreate(this.recipe);

  @override
  List<Object> get props => [recipe];

  @override
  String toString() => 'Recipe Created {recipe Id: ${recipe.id}}';
}

class RecipeUpdate extends RecipeEvent {
  final int id;
  final RecipeUpdateDto recipe;

  const RecipeUpdate(this.id, this.recipe);

  @override
  List<Object> get props => [id, recipe];

  @override
  String toString() => 'Recipe Updated {recipe Id: ${recipe.id}}';
}

class RecipeDelete extends RecipeEvent {
  final int id;

  const RecipeDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Recipe Deleted {recipe Id: $id}';

  @override
  bool? get stringify => true;
}
