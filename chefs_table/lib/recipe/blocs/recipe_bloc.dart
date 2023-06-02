import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/recipe_repository.dart';
import 'blocs.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;

  RecipeBloc({required this.recipeRepository}) : super(RecipeLoading()) {
    on<RecipeLoad>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipes = await recipeRepository.fetchAll();
        emit(RecipeOperationSuccess(recipes));
      } catch (error) {
        emit(RecipeOperationFailure(error));
      }
    });

    on<RecipeCreate>((event, emit) async {
      try {
        await recipeRepository.create(event.recipe);
        final recipes = await recipeRepository.fetchAll();
        emit(RecipeOperationSuccess(recipes));
      } catch (error) {
        emit(RecipeOperationFailure(error));
      }
    });

    on<RecipeUpdate>((event, emit) async {
      try {
        await recipeRepository.update(event.id, event.recipe);
        final recipes = await recipeRepository.fetchAll();
        emit(RecipeOperationSuccess(recipes));
      } catch (error) {
        emit(RecipeOperationFailure(error));
      }
    });

    on<RecipeDelete>((event, emit) async {
      try {
        await recipeRepository.delete(event.id);
        final recipes = await recipeRepository.fetchAll();
        inspect(recipes);
        emit(RecipeOperationSuccess(recipes));
      } catch (error) {
        emit(RecipeOperationFailure(error));
      }
    });
  }
}
