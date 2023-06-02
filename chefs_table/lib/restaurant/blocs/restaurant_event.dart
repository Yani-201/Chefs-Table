import 'package:chefs_table/restaurant/models/restaurantUpdateDto.dart';
import 'package:equatable/equatable.dart';

import '../models/restaurant.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class RestaurantLoad extends RestaurantEvent {
  const RestaurantLoad();

  @override
  List<Object> get props => [];
}

class RestaurantCreate extends RestaurantEvent {
  final Restaurant restaurant;

  const RestaurantCreate(this.restaurant);

  @override
  List<Object> get props => [restaurant];

  @override
  String toString() => 'Restaurant Created {restaurant Id: ${restaurant.id}}';
}

class RestaurantUpdate extends RestaurantEvent {
  final int id;
  final RestaurantUpdateDto restaurant;

  const RestaurantUpdate(this.id, this.restaurant);

  @override
  List<Object> get props => [id, restaurant];

  @override
  String toString() => 'Restaurant Updated {restaurant Id: ${restaurant.id}}';
}

class RestaurantDelete extends RestaurantEvent {
  final int id;

  const RestaurantDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Restaurant Deleted {restaurant Id: $id}';

  @override
  bool? get stringify => true;
}
