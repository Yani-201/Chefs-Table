import 'package:equatable/equatable.dart';

import '../models/recipe.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeLoading extends RecipeState {}

class RecipeOperationSuccess extends RecipeState {
  final List<Recipe> recipes;

  const RecipeOperationSuccess([this.recipes = const []]);

  @override
  List<Object> get props => [recipes];
}

class RecipeOperationFailure extends RecipeState {
  final Object error;

  const RecipeOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
