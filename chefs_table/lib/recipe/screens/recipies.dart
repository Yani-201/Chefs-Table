import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:chefs_table/review/models/review.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Recipes extends StatelessWidget {
  final Recipe recipe;
  static const String _baseUrl = "http://10.0.2.2:3001/";

  Recipes({super.key, required this.recipe});

  List<Widget> buildStarBlock(int starSize) {
    List<Widget> stars = [];
    for (int i = 0; i < starSize; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellowAccent));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    print(recipe.reviews);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => context.go('/recipe'),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('EDIT'),
                onTap: () => context.push('/editRecipe', extra: recipe),
              ),
              PopupMenuItem(
                  child: Text('Delete'),
                  onTap: () => context.push('/deleteRecipe', extra: recipe)),
            ],
          )
        ],
        title: Row(
          children: [
            Text(recipe.title),
          ],
        ),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.black,
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: (recipe.photo != null)
                          ? Image.network("$_baseUrl${recipe.photo}").image
                          : Image.asset("assets/food.png").image,
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.access_time,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "${recipe.time} mins",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        recipe.createdBy!.username,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recipe.ingredients.map((e) {
                    return Text("- ${e}");
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Procedures",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  recipe.procedure,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          Container(
            child: Column(children: [
              const Text(
                "Reviews",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: recipe.reviews?.length ?? 0,
                        itemBuilder: (context, index) => Card(
                            color: Color(0x1AF3F3F3),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 15,
                                backgroundImage: Image.network(
                                        "$_baseUrl${recipe.reviews![index].reviewer!.photo}")
                                    .image,
                              ),
                              title: Text(
                                  recipe.reviews![index].reviewer!.username),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber.shade600),
                                      Text((recipe.reviews != null)
                                          ? recipe.reviews![index].rating
                                              .toString()
                                          : "N/A"),
                                    ],
                                  ),
                                  Text((recipe.reviews != null)
                                      ? recipe.reviews![index].review
                                      : "N/A"),
                                ],
                              ),
                            ))
                        // return ListTile(
                        //     leading: CircleAvatar(
                        //       child: Text(review.reviewer[0]),
                        //     ),
                        //     title: Text(review.reviewer),
                        //     subtitle: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Icon(Icons.star, color: Colors.yellow),
                        //             Text(review.rating.toString()),
                        //           ],
                        //         ),
                        //         Text(review.review),
                        //       ],
                        //     ),
                        // );
                        // }
                        ),
                  )),
                ],
              )
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(child: Text('EDIT')),
                        PopupMenuItem(child: Text('Delete')),
                      ],
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    'Review and Rating',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  minLines: 4,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Leave a review',
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                Text('How was your experience?'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: buildStarBlock(5),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                context.push('/editRecipe', extra: recipe);
              },
              child: Icon(Icons.edit),
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
