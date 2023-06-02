part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ViewState extends ProfileState {
  //initalize your other values here
  //maybe user data
  //we're using dummy data so we only need boolean; if the current state is editable or not
  final bool editable;
  ViewState(this.editable);

  @override
  List<Object> get props => [editable];
}
