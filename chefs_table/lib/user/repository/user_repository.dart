import 'package:chefs_table/user/models/userUpdateDto.dart';

import '../data_providers/user_data_providers.dart';
import '../models/user.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> create(User user) async {
    return dataProvider.create(user);
  }

  Future<User> update(int id, UserUpdateDto update) async {
    return dataProvider.update(id, update);
  }

  Future<List<User>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    return dataProvider.delete(id);
  }

  Future<String> login(String username, String password) async {
    return dataProvider.login(username, password);
  }
}
