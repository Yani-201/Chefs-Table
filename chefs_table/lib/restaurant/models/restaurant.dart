// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chefs_table/user/models/user.dart';

class Restaurant {
  final int? id;
  final String name;
  final String location;
  final String phone;
  final List<dynamic>? menu;
  final dynamic photo;
  final List<User>? likes;
  final User? chefs;

  Restaurant({
    this.id,
    required this.name,
    required this.location,
    required this.phone,
    this.menu,
    this.photo,
    this.likes,
    this.chefs,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    User? headChef;
    List<User>? likes;
    if (json['chefs'] != null) {
      headChef = User.fromJson(json['chefs']);
    }

    if (json['likes'] != null && json['likes'].length != 0) {
      likes = json['likes'].map((e) => User.fromJson(e)).toList();
    }
    return Restaurant(
        id: json['id'],
        name: json['name'],
        location: json['location'],
        phone: json['phone'],
        photo: json['photo'],
        menu: jsonDecode(json['menu']),
        likes: likes,
        chefs: headChef);
  }
}
