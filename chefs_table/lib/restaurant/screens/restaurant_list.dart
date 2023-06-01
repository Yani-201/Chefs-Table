import 'package:chefs_table/user/data_providers/jwt_storage.dart';
import 'package:go_router/go_router.dart';

import '../blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});
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
        actions: [
          IconButton(
              onPressed: () {
                TokenStorage().deleteToken();
                context.go('/login');
              },
              icon: const Icon(Icons.logout_rounded))
        ],
        elevation: 7,
      ),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (_, state) {
          if (state is RestaurantOperationFailure) {
            return const Text('Could not do restaurant operation');
          }

          if (state is RestaurantOperationSuccess) {
            final restaurants = state.restaurants;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: restaurants.length,
                      itemBuilder: (context, idx) => InkWell(
                            onTap: () => context.push('/restaurantDetail',
                                extra: restaurants[idx]),
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
                                    child: (restaurants[idx].photo != null)
                                        ? FadeInImage.assetNetwork(
                                            image:
                                                "$_baseUrl${restaurants[idx].photo}",
                                            placeholder:
                                                "assets/restaurant.png",
                                          )
                                        : Image.asset("assets/restaurant.png"),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 52.0,
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundImage: (restaurants[idx]
                                                        .chefs!
                                                        .photo !=
                                                    null)
                                                ? Image.network(
                                                    "$_baseUrl${restaurants[idx].chefs!.photo!}",
                                                    scale: 1,
                                                    width: 100,
                                                  ).image
                                                : Image.asset(
                                                        'assets/profile.png')
                                                    .image,
                                          )),
                                      Text(restaurants[idx].chefs!.username),
                                      Text(
                                        restaurants[idx].name,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     const Icon(
                                      //       Icons.location_on,
                                      //       color: Colors.black87,
                                      //     ),
                                      //     Text(
                                      //       restaurants[idx].location,
                                      //     ),
                                      //   ],
                                      // ),
                                      // Row(children: [
                                      //   const Icon(
                                      //     Icons.phone,
                                      //     color: Colors.green,
                                      //   ),
                                      //   Text(restaurants[idx].phone)
                                      // ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                      onPressed: () => context.go('/createRestaurant'),
                      child: const Icon(Icons.add)),
                ),
              ],
            );
            //   child: Card(ListTile(
            //     title: Text(restaurants[idx].title),
            //     leading: SizedBox(
            //       width: 160,
            //       height: 120,
            //       child: FadeInImage.assetNetwork(
            //         image: "$_baseUrl${restaurants[idx].photo}",
            //         placeholder: "assets/food.png",
            //       ),
            //     ),
            //     trailing: Text(restaurants[idx].rating.toString()),
            //   ),
            // ));
          }

          return const CircularProgressIndicator();
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
