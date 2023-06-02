import 'package:chefs_table/restaurant/models/restaurantUpdateDto.dart';

import '../data_providers/restaurant_data_provider.dart';
import '../models/restaurant.dart';

class RestaurantRepository {
  final RestaurantDataProvider dataProvider;
  RestaurantRepository(this.dataProvider);

  Future<Restaurant> create(Restaurant restaurant) async {
    return dataProvider.create(restaurant);
  }

  Future<Restaurant> update(int id, RestaurantUpdateDto update) async {
    return dataProvider.update(id, update);
  }

  Future<List<Restaurant>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    return dataProvider.delete(id);
  }
}
