part of 'pin_screen_bloc.dart';

sealed class PinScreenState {
  final PinStage stage;

  PinScreenState.initial() : stage = PinStage.initial;
  PinScreenState.fromState(PinScreenState state, {PinStage? stage}) : stage = stage ?? state.stage;
}

final class InitialState extends PinScreenState {
  InitialState() : super.initial();
}

final class ContentState extends PinScreenState {
  ContentState.fromState(super.state, {super.stage}) : super.fromState();
}

final class ShowBiometryDialogState extends PinScreenState {
  ShowBiometryDialogState.fromState(super.state) : super.fromState(stage: PinStage.submitted);
}

final class NavigateToSelectWalletState extends PinScreenState {
  NavigateToSelectWalletState.fromState(super.state) : super.fromState(stage: PinStage.submitted);
}

enum PinStage { initial, repeat, submitted }
