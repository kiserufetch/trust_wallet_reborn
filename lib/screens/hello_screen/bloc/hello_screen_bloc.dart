import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hello_screen_event.dart';
part 'hello_screen_state.dart';

class HelloScreenBloc extends Bloc<HelloScreenEvent, HelloScreenState> {
  HelloScreenBloc() : super(InitialState()) {
    on<NavigateToPinEvent>(_onNavigateToPinEvent);
  }

  FutureOr<void> _onNavigateToPinEvent(NavigateToPinEvent event, Emitter<HelloScreenState> emit) {
    emit(NavigateToPin());
  }
}
