import 'package:chefs_table/widget_handler.dart';
import 'package:go_router/go_router.dart';

import '../blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});
  static const String _baseUrl = "http://10.0.2.2:3001/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef\'s Table'),
        backgroundColor: Colors.black,
        leading: BackButton(
          onPressed: () => context.go('/home'),
        ),
        elevation: 7,
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (_, state) {
          if (state is RecipeOperationFailure) {
            return const Text('Could not do recipe operation');
          } else if (state is RecipeOperationSuccess) {
            final recipes = state.recipes;

            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: recipes.length,
                        itemBuilder: (context, idx) => InkWell(
                              onTap: (() {
                                context.push('/recipeDetail',
                                    extra: recipes[idx]);
                              }),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      height: 120,
                                      child: FadeInImage.assetNetwork(
                                        image: "$_baseUrl${recipes[idx].photo}",
                                        placeholder: "assets/food.png",
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            recipes[idx].title,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                              "Prep Time: ${recipes[idx].time}mins"),
                                          const SizedBox(height: 3),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: WidgetHandler()
                                                .buildStarBlock(
                                                    recipes[idx].rating ?? 0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                      onPressed: () => context.go('/createRecipe'),
                      child: const Icon(Icons.add)),
                ),
              ],
            );

            //   child: Card(ListTile(
            //     title: Text(recipes[idx].title),
            //     leading: SizedBox(
            //       width: 160,
            //       height: 120,
            //       child: FadeInImage.assetNetwork(
            //         image: "$_baseUrl${recipes[idx].photo}",
            //         placeholder: "assets/food.png",
            //       ),
            //     ),
            //     trailing: Text(recipes[idx].rating.toString()),
            //   ),
            // ));
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),

      // Column(
      //       children: [
      //         const Text("Find the recipies to your favourite meals",
      //             style: TextStyle(fontSize: 28, fontFamily: 'Raleway')),
      //         const SizedBox(
      //           height: 15,
      //         )

      // ])
    );
  }
}
