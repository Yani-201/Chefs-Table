// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chefs_table/restaurant/models/restaurant.dart';
import 'package:chefs_table/review/models/review.dart';

import '../../recipe/models/recipe.dart';

class User {
  final int? id;
  final String username;
  final String email;
  final List<dynamic>? role;
  final String? password;
  final String? photo;
  final List<dynamic>? reviews;
  final List<dynamic>? created;
  final Restaurant? worksFor;
  final List<Restaurant?>? likedRestaurants;

  User({
    this.id,
    required this.username,
    required this.email,
    this.photo,
    this.password,
    this.reviews,
    this.role,
    this.created,
    this.worksFor,
    this.likedRestaurants,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    Restaurant? restaurant;
    List<dynamic>? reviews;
    if (json['worksFor'] != null) {
      restaurant = Restaurant.fromJson(json['worksFor']);
    } else {
      restaurant = null;
    }
    if (json['reviews'] != null) {
      reviews = json['reviews']?.map((e) => Review.fromJson(e)).toList();
    }
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        photo: json['photo'],
        reviews: reviews,
        created: json['created']?.map((e) => Recipe.fromJson(e)).toList(),
        worksFor: restaurant,
        likedRestaurants: json['likedRestaurants']);
  }
}
