import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/user_repository.dart';
import 'blocs.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserLoading()) {
    on<UserLoad>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchAll();
        emit(UserOperationSuccess(users));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });

    on<UserCreate>((event, emit) async {
      try {
        await userRepository.create(event.user);
        print("here3");
        final users = await userRepository.fetchAll();
        emit(UserOperationSuccess(users));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });

    on<UserUpdate>((event, emit) async {
      try {
        await userRepository.update(event.id, event.user);
        final users = await userRepository.fetchAll();
        emit(UserOperationSuccess(users));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });

    on<UserDelete>((event, emit) async {
      try {
        await userRepository.delete(event.id);
        final users = await userRepository.fetchAll();
        emit(UserOperationSuccess(users));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });

    on<UserLogIn>(
      (event, emit) async {
        emit(UserLoggingIn());

        try {
          print("From Bloc ${event.username}  ${event.password}");
          String token =
              await userRepository.login(event.username, event.password);
          print("FROM BLOC TOKEN $token");
          emit(UserLoggedIn(token));
        } catch (error) {
          emit(UserOperationFailure(error));
        }
      },
    );
  }
}
