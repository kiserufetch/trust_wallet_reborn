part of 'hello_screen_bloc.dart';

@immutable
sealed class HelloScreenEvent {}

class NavigateToPinEvent extends HelloScreenEvent {}
