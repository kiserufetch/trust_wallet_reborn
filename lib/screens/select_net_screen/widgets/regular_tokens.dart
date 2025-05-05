import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/models/token_enum.dart';
import 'package:trust_wallet_reborn/screens/restore_screen/restore_screen.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class RegularTokens extends StatefulWidget {
  const RegularTokens({super.key});

  @override
  State<RegularTokens> createState() => _RegularTokensState();
}

class _RegularTokensState extends State<RegularTokens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: UITheme.background,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: Token.values.map((e) => Column(children: [_RegularToken(e), if (e != Token.values.last) SizedBox(height: 1)])).toList(),
        ),
      ),
    );
  }
}

class _RegularToken extends StatelessWidget {
  final Token token;

  const _RegularToken(this.token);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UITheme.ui24,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) => RestoreScreen(token: token)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: 52.0,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(99.0),
                child: SizedBox(height: 38.0, width: 38.0, child: Image.asset(token.iconPath)),
              ),
              SizedBox(width: 8.0),
              Expanded(child: Text(token.name, style: TextStyle(color: UITheme.buttonTextLight, fontSize: 16.0))),
              Icon(Icons.keyboard_arrow_right_rounded, color: UITheme.iconsGrey),
            ],
          ),
        ),
      ),
    );
  }
}
