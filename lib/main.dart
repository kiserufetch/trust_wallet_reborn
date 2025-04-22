import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/di.dart';
import 'package:trust_wallet_reborn/screens/hello_screen/hello_screen.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DI.init();
  runApp(EasyLocalization(supportedLocales: const [Locale('en'), Locale('ru')], path: 'assets/translations', child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trust Wallet Reborn',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(backgroundColor: UITheme.background, body: const HelloScreen()),
    );
  }
}
