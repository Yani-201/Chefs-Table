import 'dart:convert';

import 'package:chefs_table/restaurant/models/restaurantUpdateDto.dart';
import 'package:chefs_table/user/data_providers/jwt_storage.dart';

import '../models/restaurant.dart';
import 'package:http/http.dart' as http;

class RestaurantDataProvider {
  static const String _baseUrl = "http://10.0.2.2:3001/restaurants";
  String jwtToken = "";
  Map<String, String> header = {
    "Content-Type": "application/json",
  };

  Future<Restaurant> create(Restaurant restaurant) async {
    jwtToken = (await TokenStorage().getToken()) ?? "";
    header = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwtToken"
    };
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: header,
        body: jsonEncode({
          "name": restaurant.name,
          "location": restaurant.location,
          "phone": restaurant.phone,
          "menu": restaurant.menu,
          "photo": restaurant.photo
        }));
    if (response.statusCode == 201) {
      return Restaurant.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<Restaurant> update(int id, RestaurantUpdateDto restaurant) async {
    jwtToken = (await TokenStorage().getToken()) ?? "";
    header = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwtToken"
    };

    // final updateUser = {};
    // // if (title != null) {
    // //   updateUser[title] = title;
    // // }
    // // if (procedure != null) {
    // //   updateUser[procedure] = procedure;
    // // }
    // // if (ingredients != null) {
    // //   updateUser[ingredients] = ingredients;
    // // }
    // // if (photo != null) {
    // //   updateUser[photo] = photo;
    // // }
    String updateBody = jsonEncode(<String, dynamic>{
      "name": restaurant.name,
      "location": restaurant.location,
      "phone": restaurant.phone,
      "photo": restaurant.photo
    });
    final response = await http.patch(Uri.parse("$_baseUrl/$id"),
        headers: header, body: updateBody);

    if ((response.statusCode / 100).floor() == 2) {
      return Restaurant.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<Restaurant> fetch(int id) async {
    jwtToken = (await TokenStorage().getToken()) ?? "";
    header = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwtToken"
    };

    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return Restaurant.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<List<Restaurant>> fetchAll() async {
    jwtToken = (await TokenStorage().getToken()) ?? "";
    header = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwtToken"
    };

    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final restaurants = jsonDecode(response.body) as List;
      return restaurants.map((c) => Restaurant.fromJson(c)).toList();
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<void> delete(int id) async {
    jwtToken = (await TokenStorage().getToken()) ?? "";
    header = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwtToken"
    };

    final response =
        await http.delete(Uri.parse("$_baseUrl/$id"), headers: header);
    if (response.statusCode != 200) {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }
}
