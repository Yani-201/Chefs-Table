import 'dart:convert';
import 'dart:developer';

import 'package:chefs_table/user/data_providers/jwt_storage.dart';
import 'package:chefs_table/user/models/user.dart';

import '../models/userUpdateDto.dart';

import 'package:http/http.dart' as http;

class UserDataProvider {
  static const String _baseUrl = "http://10.0.2.2:3001";
  String jwtToken = "";
  Map<String, String> header = {
    "Content-Type": "application/json",
  };

  Future<User> create(User user) async {
    final http.Response response = await http.post(Uri.parse("$_baseUrl/users"),
        headers: header,
        body: jsonEncode({
          "username": user.username,
          "password": user.password,
          "email": user.email,
          "roles": user.role ?? ["user"],
        }));
    if (response.statusCode == 201) {
      inspect(response);
      String responded = response.body.replaceAll('\n', '');
      print("###################$responded");
      return User.fromJson(jsonDecode(responded));
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<User> update(int id, UserUpdateDto user) async {
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
      "oldPassword": user.oldPassword,
      "newUsername": user.username,
      "newPassword": user.password,
      "newRoles": user.role,
    });
    final response = await http.patch(Uri.parse("$_baseUrl/$id"),
        headers: header, body: updateBody);

    if ((response.statusCode / 100).floor() == 2) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<User> fetch(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<List<User>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((c) => User.fromJson(c)).toList();
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
        await http.delete(Uri.parse("$_baseUrl/users/$id"), headers: header);
    if (response.statusCode != 200) {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }

  Future<String> login(String username, String password) async {
    final response = await http.post(Uri.parse("$_baseUrl/login"),
        headers: header,
        body: jsonEncode({"username": username, "password": password}));

    if ((response.statusCode / 100).floor() == 2) {
      inspect(response);
      String responded = response.body.replaceAll('\n', '');
      String token = jsonDecode(responded)["access_token"];
      print("#####$token###########");
      TokenStorage().saveToken(token);
      return token;
    } else {
      throw Exception(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]);
    }
  }
}
