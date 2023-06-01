import 'package:chefs_table/restaurant/models/restaurant.dart';
import 'package:chefs_table/restaurant/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const DeleteRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(
              onPressed: () => context.go('/restaurant'),
            ),
            title: Text("Delete ${restaurant.name.toString()}")),
        body: BlocListener<RestaurantBloc, RestaurantState>(
          listener: (context, state) {
            if (state is RestaurantOperationSuccess) {
              context.go('/restaurant');
            }
            if (state is RestaurantOperationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text("Restaurant Delete failed: ${state.error}"),
                duration: const Duration(seconds: 2),
              ));
              BlocProvider.of<RestaurantBloc>(context).add(RestaurantLoad());
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Are you sure you want to delete ${restaurant.name}? "),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<RestaurantBloc>(context)
                            .add(RestaurantDelete(restaurant.id!));
                        context.go('/restaurant');
                      },
                      child: const Text("Yes")),
                  ElevatedButton(
                      onPressed: () =>
                          context.go('/restaurantDetail', extra: restaurant),
                      child: const Text("No"))
                ],
              )
            ],
          ),
        ));
  }
}
