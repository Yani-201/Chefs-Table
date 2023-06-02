part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List get props => [];
}

//used this class if you want to fetch any type of data from repo
class GiveMeData extends ProfileEvent {}

class EditableEvent extends ProfileEvent {}
