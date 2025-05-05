import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trust_wallet_reborn/models/token_enum.dart';
import 'package:trust_wallet_reborn/screens/wallet_screen/wallet_screen.dart';
import 'package:trust_wallet_reborn/uikit/buttons/ui_fab.dart';
import 'package:trust_wallet_reborn/uikit/ui_appbar.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class RestoreScreen extends StatefulWidget {
  final Token token;
  const RestoreScreen({super.key, required this.token});

  @override
  State<RestoreScreen> createState() => _RestoreScreenState();
}

class _RestoreScreenState extends State<RestoreScreen> {
  late final TextEditingController nameController;
  late final TextEditingController guardController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: '${widget.token.name} Кошелек 1');
    guardController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIAppBar(title: 'Восстановить ${widget.token.name}', centerTitle: true, actionIcons: [Icons.qr_code_rounded]),
      backgroundColor: UITheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Название кошелька', style: TextStyle(color: UITheme.textDarkGrey, fontSize: 13, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            TextField(
              controller: nameController,
              autofocus: true,
              cursorColor: UITheme.buttonGreen,
              onChanged: (_) => setState(() => {}),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: UITheme.pinBorder, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: UITheme.buttonGreen, width: 2),
                ),
                suffixIcon: nameController.text.isEmpty ? null : Icon(Icons.close_rounded, color: UITheme.iconsGrey),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            Text('Секретная фраза', style: TextStyle(color: UITheme.textDarkGrey, fontSize: 13, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                TextField(
                  controller: guardController,
                  cursorColor: UITheme.buttonGreen,
                  maxLines: 4,
                  minLines: 4,
                  onChanged: (_) => setState(() => {}),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: UITheme.pinBorder, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: UITheme.buttonGreen, width: 2),
                    ),
                    suffixIcon: guardController.text.isEmpty ? null : Icon(Icons.close_rounded, color: UITheme.iconsGrey),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: UIFAB.text(
                    'Вставить',
                    onTap: () async {
                      ClipboardData? data = await Clipboard.getData('text/plain');
                      if (data != null) {
                        guardController.text = data.text!;
                        setState(() {});
                      }
                    },
                    isExpanded: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Обычно 12 (иногда 18, 24) слов, разделённых пробелами', style: TextStyle(color: UITheme.textDarkGrey, fontSize: 13)),
            SizedBox(height: 16),
            guardController.text.isEmpty || nameController.text.isEmpty
                ? UIFAB.primaryDark('Восстановить кошелек', onTap: () {}, isDisabled: true)
                : UIFAB.primary(
                  'Восстановить кошелек',
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute<void>(builder: (BuildContext context) => const WalletScreen(token: Token.bnbSmartChain)));
                  },
                ),
            SizedBox(height: 16),
            UIFAB.text('Что такое секретная фраза?', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
