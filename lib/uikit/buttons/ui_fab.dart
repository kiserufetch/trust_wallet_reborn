import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class UIFAB extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  final Color _background;
  final Color _foreground;

  const UIFAB.primary(this.title, {super.key, required this.onTap})
    : _background = UITheme.buttonGreen,
      _foreground = UITheme.buttonTextDark;

  const UIFAB.primaryDark(this.title, {super.key, required this.onTap})
    : _background = UITheme.buttonDarkGreen,
      _foreground = UITheme.buttonGreen;

      const UIFAB.text(this.title, {super.key, required this.onTap})
    : _background = Colors.transparent,
      _foreground = UITheme.buttonGreen;

  const UIFAB.grey(this.title, {super.key, required this.onTap}) : _background = UITheme.buttonGrey, _foreground = UITheme.buttonTextLight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32.0),
      child: Ink(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        decoration: BoxDecoration(color: _background, borderRadius: BorderRadius.circular(32.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title, style: TextStyle(fontWeight: FontWeight.w500, color: _foreground, fontSize: 16))],
        ),
      ),
    );
  }
}
