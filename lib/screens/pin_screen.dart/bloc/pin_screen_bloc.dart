import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pin_screen_event.dart';
part 'pin_screen_state.dart';

class PinScreenBloc extends Bloc<PinScreenEvent, PinScreenState> {
  PinScreenBloc() : super(InitialState()) {
    on<NextStage>(_onNextStage);
    on<ShowBiometryDialog>(_onShowBiometryDialog);
    on<NavigateToSelectWallet>(_onNavigateToSelectWallet);
  }

  FutureOr<void> _onNextStage(NextStage event, Emitter<PinScreenState> emit) {
    emit(ContentState.fromState(state, stage: PinStage.repeat));
  }

  FutureOr<void> _onShowBiometryDialog(ShowBiometryDialog event, Emitter<PinScreenState> emit) {
    emit(ShowBiometryDialogState.fromState(state));
  }

  FutureOr<void> _onNavigateToSelectWallet(NavigateToSelectWallet event, Emitter<PinScreenState> emit) {
    emit(NavigateToSelectWalletState.fromState(state));
  }
}
