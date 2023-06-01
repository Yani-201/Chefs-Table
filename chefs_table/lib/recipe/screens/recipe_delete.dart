import 'package:chefs_table/recipe/blocs/blocs.dart';
import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecipeRemove extends StatelessWidget {
  final Recipe recipe;
  const RecipeRemove({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(
              onPressed: () => context.go('/recipe'),
            ),
            title: Text("Delete ${recipe.id.toString()}")),
        body: BlocListener<RecipeBloc, RecipeState>(
          listener: (context, state) async {
            {
              if (state is RecipeOperationSuccess) {
                context.go('/recipe');
              }
              if (state is RecipeOperationFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text("Recipe Deletion failed: ${state.error}"),
                  duration: const Duration(seconds: 3),
                ));
                BlocProvider.of<RecipeBloc>(context).add(RecipeLoad());
              }
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Are you sure you want to delete? "),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<RecipeBloc>(context)
                            .add(RecipeDelete(recipe.id!));
                      },
                      child: const Text("Yes")),
                  ElevatedButton(
                      onPressed: () =>
                          context.go('/recipeDetail', extra: recipe),
                      child: const Text("No"))
                ],
              )
            ],
          ),
        ));
  }
}
