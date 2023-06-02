import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/restaurant_repository.dart';
import 'blocs.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository restaurantRepository;

  RestaurantBloc({required this.restaurantRepository})
      : super(RestaurantLoading()) {
    on<RestaurantLoad>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurants = await restaurantRepository.fetchAll();
        emit(RestaurantOperationSuccess(restaurants));
      } catch (error) {
        emit(RestaurantOperationFailure(error));
      }
    });

    on<RestaurantCreate>((event, emit) async {
      try {
        await restaurantRepository.create(event.restaurant);
        final restaurants = await restaurantRepository.fetchAll();
        emit(RestaurantOperationSuccess(restaurants));
      } catch (error) {
        emit(RestaurantOperationFailure(error));
      }
    });

    on<RestaurantUpdate>((event, emit) async {
      try {
        await restaurantRepository.update(event.id, event.restaurant);
        final restaurants = await restaurantRepository.fetchAll();
        emit(RestaurantOperationSuccess(restaurants));
      } catch (error) {
        emit(RestaurantOperationFailure(error));
      }
    });

    on<RestaurantDelete>((event, emit) async {
      try {
        await restaurantRepository.delete(event.id);
        final restaurants = await restaurantRepository.fetchAll();
        emit(RestaurantOperationSuccess(restaurants));
      } catch (error) {
        emit(RestaurantOperationFailure(error));
      }
    });
  }
}
