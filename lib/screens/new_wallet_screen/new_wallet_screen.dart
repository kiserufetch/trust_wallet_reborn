import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/screens/new_wallet_screen/widgets/transition_button.dart';
import 'package:trust_wallet_reborn/screens/select_net_screen/select_net_screen.dart';
import 'package:trust_wallet_reborn/uikit/buttons/ui_fab.dart';
import 'package:trust_wallet_reborn/uikit/ui_appbar.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class NewWalletScreen extends StatefulWidget {
  const NewWalletScreen({super.key});

  @override
  State<NewWalletScreen> createState() => _NewWalletScreenState();
}

class _NewWalletScreenState extends State<NewWalletScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showBottomSheet();
    });
  }

  Future<void> showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) {
        return BottomSheet(
          backgroundColor: UITheme.dialogBg,
          onClosing: () {},
          enableDrag: false,
          builder: (context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [IconButton(onPressed: () {}, icon: Icon(Icons.close, size: 30.0))],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    FlutterLogo(size: 100),
                    SizedBox(height: 32.0),
                    Text(
                      'Будьте в курсе событий на рынке!',
                      style: TextStyle(color: UITheme.textGrey, fontSize: 26.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Следите за ценами на ваши криптоактивы и получайте обновления о транзакциях.',
                      style: TextStyle(color: UITheme.textDarkGrey, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    UIFAB.primary('Включить', onTap: () {}),
                    SizedBox(height: 8.0),
                    UIFAB.text('Пропустить, активирую позднее', onTap: () {}),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UITheme.background,
      appBar: UIAppBar(title: 'Добавить существующий кошелек'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Популярное', style: TextStyle(color: UITheme.textGrey, fontSize: 14)),
            SizedBox(height: 16.0),
            TransitionButton(title: 'Секретная фраза', icon: Icons.close),
            SizedBox(height: 16.0),
            TransitionButton(
              title: 'Приватный ключ',
              icon: Icons.lock_rounded,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) => const SelectNetScreen()));
              },
            ),
            SizedBox(height: 16.0),
            Text('Другие варианты', style: TextStyle(color: UITheme.textGrey, fontSize: 14)),
            SizedBox(height: 16.0),
            TransitionButton.small(title: 'Google Drive резервное копирование', icon: Icons.copy_all_rounded),
            SizedBox(height: 16.0),
            TransitionButton.small(title: 'Кошелек только для просмотра', icon: Icons.remove_red_eye_rounded),
            SizedBox(height: 16.0),
            TransitionButton.small(title: 'Keystore', icon: Icons.key_outlined),
            SizedBox(height: 16.0),
            TransitionButton.small(title: 'Swift', icon: Icons.settings_rounded, showBeta: true),
          ],
        ),
      ),
    );
  }
}
