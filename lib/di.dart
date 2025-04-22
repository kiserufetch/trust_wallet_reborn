import 'package:get_it/get_it.dart';
import 'package:trust_wallet_reborn/screens/hello_screen/bloc/hello_screen_bloc.dart';
import 'package:trust_wallet_reborn/screens/pin_screen.dart/bloc/pin_screen_bloc.dart';

abstract class DI {
  static void init() {
    final i = GetIt.I;

    _initBlocs(i);
  }

  static void _initBlocs(GetIt i) {
    i.registerFactory(() => HelloScreenBloc());
    i.registerFactory(() => PinScreenBloc());
  }
}
