<<<<<<< HEAD
import 'package:chefs_table/review/models/review.dart';
import 'package:chefs_table/user/models/user.dart';

class RecipeUpdateDto {
  final int? id;
  final String? title;
  final String? procedure;
  final List<dynamic>? ingredients;
  final dynamic? photo;
  final int? rating;
  final num? time;
  final User? createdBy;
  final List<dynamic>? reviews;

  RecipeUpdateDto({
    this.id,
    this.title,
    this.procedure,
    this.ingredients,
    this.time,
    this.photo,
    this.rating,
    this.createdBy,
    this.reviews,
  });

  factory RecipeUpdateDto.fromJson(Map<String, dynamic> json) {
    List<dynamic>? reviews;
    if (json['reviews'] != null && json['reviews'].length > 0) {
      reviews = json['reviews']?.map((e) => Review.fromJson(e))?.toList();
    }
    return RecipeUpdateDto(
        id: json['id'],
        title: json['title'],
        procedure: json['procedure'],
        ingredients: json['ingredients'],
        photo: json['photo'],
        rating: json['rating'],
        time: json['time'],
        createdBy: (json['createdBy'] != null)
            ? User.fromJson(json['createdBy'])
            : null,
        reviews: reviews ?? null);
  }
}
=======
import 'package:chefs_table/review/models/review.dart';
import 'package:chefs_table/user/models/user.dart';

class RecipeUpdateDto {
  final int? id;
  final String? title;
  final String? procedure;
  final List<dynamic>? ingredients;
  final dynamic? photo;
  final int? rating;
  final num? time;
  final User? createdBy;
  final List<dynamic>? reviews;

  RecipeUpdateDto({
    this.id,
    this.title,
    this.procedure,
    this.ingredients,
    this.time,
    this.photo,
    this.rating,
    this.createdBy,
    this.reviews,
  });

  factory RecipeUpdateDto.fromJson(Map<String, dynamic> json) {
    List<dynamic>? reviews;
    if (json['reviews'] != null && json['reviews'].length > 0) {
      reviews = json['reviews']?.map((e) => Review.fromJson(e))?.toList();
    }
    return RecipeUpdateDto(
        id: json['id'],
        title: json['title'],
        procedure: json['procedure'],
        ingredients: json['ingredients'],
        photo: json['photo'],
        rating: json['rating'],
        time: json['time'],
        createdBy: (json['createdBy'] != null)
            ? User.fromJson(json['createdBy'])
            : null,
        reviews: reviews ?? null);
  }
}
>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
