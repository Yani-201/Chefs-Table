<<<<<<< HEAD
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:chefs_table/user/models/user.dart';

class Review {
  final int? id;
  final int rating;
  final String review;
  final Recipe? recipe;
  final User? reviewer;

  Review({
    this.id,
    required this.rating,
    required this.review,
    this.recipe,
    this.reviewer,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      review: json['review'],
      recipe: json['recipe'],
      reviewer:
          (json['reviewer'] != null) ? User.fromJson(json['reviewer']) : null,
    );
  }
}
=======
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chefs_table/recipe/models/recipe.dart';
import 'package:chefs_table/user/models/user.dart';

class Review {
  final int? id;
  final int rating;
  final String review;
  final Recipe? recipe;
  final User? reviewer;

  Review ({
    this.id,
    required this.rating,
    required this.review,
    this.recipe,
    this.reviewer,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      review: json['review'],
      recipe: json['recipe'],
      reviewer:
          (json['reviewer'] != null) ? User.fromJson(json['reviewer']) : null,
    );
  }
}

>>>>>>> c5908b340f33a5070444762cdbd02208ea618d6d
