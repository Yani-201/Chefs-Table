import 'package:equatable/equatable.dart';

import '../models/restaurant.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantLoading extends RestaurantState {}

class RestaurantOperationSuccess extends RestaurantState {
  final List<Restaurant> restaurants;

  const RestaurantOperationSuccess([this.restaurants = const []]);

  @override
  List<Object> get props => [restaurants];
}

class RestaurantOperationFailure extends RestaurantState {
  final Object error;

  const RestaurantOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
