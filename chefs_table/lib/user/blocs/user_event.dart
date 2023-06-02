// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:chefs_table/user/models/userUpdateDto.dart';

import '../models/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoad extends UserEvent {
  const UserLoad();

  @override
  List<Object> get props => [];
}

class UserLogIn extends UserEvent {
  final String username;
  final String password;

  const UserLogIn(
    this.username,
    this.password,
  );

  @override
  List<Object> get props => [username, password];

  @override
  String toString() => 'User $username logging in';
}

class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {user Id: ${user.id}}';
}

class UserUpdate extends UserEvent {
  final int id;
  final UserUpdateDto user;

  const UserUpdate(this.id, this.user);

  @override
  List<Object> get props => [id, user];

  @override
  String toString() => 'User Updated {user Id: ${user.username}}';
}

class UserDelete extends UserEvent {
  final int id;

  const UserDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {user Id: $id}';

  @override
  bool? get stringify => true;
}
