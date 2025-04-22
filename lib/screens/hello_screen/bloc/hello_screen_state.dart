part of 'hello_screen_bloc.dart';

@immutable
sealed class HelloScreenState {}

final class InitialState extends HelloScreenState {}
final class NavigateToPin extends HelloScreenState {}
