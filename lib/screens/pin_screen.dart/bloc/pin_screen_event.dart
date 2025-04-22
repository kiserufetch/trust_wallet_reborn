part of 'pin_screen_bloc.dart';

@immutable
sealed class PinScreenEvent {}

class NextStage extends PinScreenEvent {}
class ShowBiometryDialog extends PinScreenEvent {}
class NavigateToSelectWallet extends PinScreenEvent {}
