import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/uikit/buttons/ui_fab.dart';
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
                    Row(children: [IconButton(onPressed: () {}, icon: Icon(Icons.close, size: 30.0,))], mainAxisAlignment: MainAxisAlignment.end,),
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
      appBar: AppBar(
        title: Text('Добавить существующий кошелек', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 18)),
        backgroundColor: UITheme.background,
        foregroundColor: UITheme.buttonTextLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Популярное', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 14)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                title: Text('Секретная фраза', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 16)),
                onTap: () {
                  showBottomSheet();
                },
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: UITheme.buttonTextLight, size: 18.0),
                leading: Icon(Icons.access_alarms_rounded, color: UITheme.buttonTextLight),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                title: Text('Приватный ключ', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 16)),
                onTap: () {},
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: UITheme.buttonTextLight, size: 18.0),
                leading: Icon(Icons.key, color: UITheme.buttonTextLight),
              ),
            ),
            Text('Другие варианты', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 14)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                title: Text('Удивление', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 16)),
                onTap: () {},
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: UITheme.buttonTextLight, size: 18.0),
                leading: Icon(Icons.sim_card_alert, color: UITheme.buttonTextLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
