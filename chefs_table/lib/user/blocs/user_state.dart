import 'package:equatable/equatable.dart';

import '../models/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoggingIn extends UserState {}

class UserLoggedIn extends UserState {
  final String token;
  const UserLoggedIn([this.token = ""]);

  @override
  List<Object> get props => [token];
}

class UserOperationSuccess extends UserState {
  final List<User> users;

  const UserOperationSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserOperationFailure extends UserState {
  final Object error;

  const UserOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
