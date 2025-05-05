import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/screens/select_net_screen/widgets/multi_token.dart';
import 'package:trust_wallet_reborn/screens/select_net_screen/widgets/regular_tokens.dart';
import 'package:trust_wallet_reborn/screens/select_net_screen/widgets/search_field.dart';
import 'package:trust_wallet_reborn/uikit/ui_appbar.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class SelectNetScreen extends StatefulWidget {
  const SelectNetScreen({super.key});

  @override
  State<SelectNetScreen> createState() => _SelectNetScreenState();
}

class _SelectNetScreenState extends State<SelectNetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UITheme.background,
      appBar: UIAppBar(title: 'Выберите сеть', centerTitle: true, actionIcons: [Icons.info_rounded]),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), child: SearchField()),
          Expanded(
            child: ListView(
              clipBehavior: Clip.hardEdge,
              children: [SizedBox(height: 32), MultiToken(), SizedBox(height: 32), RegularTokens()],
            ),
          ),
        ],
      ),
    );
  }
}
