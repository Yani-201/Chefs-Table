import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GiveMeData>(_giveMeData);
    on<EditableEvent>(_handleEvent);
  }

  _giveMeData(event, emit) async {
    //simulating you getting data
    await Future.delayed(Duration(seconds: 2));
    emit(ViewState(false));
  }

  _handleEvent(event, emit) {
    if (state is ViewState) {
      emit(ViewState(!(state as ViewState).editable));
    }
  }
}
