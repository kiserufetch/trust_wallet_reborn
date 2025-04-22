import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trust_wallet_reborn/screens/hello_screen/bloc/hello_screen_bloc.dart';
import 'package:trust_wallet_reborn/screens/pin_screen.dart/pin_screen.dart';
import 'package:trust_wallet_reborn/uikit/buttons/ui_fab.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  late final HelloScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<HelloScreenBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HelloScreenBloc, HelloScreenState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is NavigateToPin) {
          Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) => const PinScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: UITheme.background,
          body: SafeArea(
            bottom: true,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      UIFAB.primary('Создать новый кошелёк', onTap: () {}),
                      const SizedBox(height: 16.0),
                      UIFAB.grey(
                        'У меня уже есть кошелёк',
                        onTap: () {
                          bloc.add(NavigateToPinEvent());
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Text('Нажимая любую кнопку, вы принимаете наши ', style: TextStyle(color: UITheme.textGrey, fontSize: 13.0)),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: UITheme.textGrey, fontSize: 13.0),
                          children: [
                            TextSpan(text: 'Условия обслуживания', style: TextStyle(color: UITheme.textLink)),
                            TextSpan(text: ' и '),
                            TextSpan(text: 'Политика конфиденциальности', style: TextStyle(color: UITheme.textLink)),
                            TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
