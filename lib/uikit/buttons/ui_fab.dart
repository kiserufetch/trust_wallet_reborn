import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class UIFAB extends StatelessWidget {
  final String title;
  final bool isDisabled;
  final bool isExpanded;
  final void Function()? onTap;

  final Color _background;
  final Color _foreground;

  const UIFAB.primary(this.title, {super.key, required this.onTap, this.isDisabled = false, this.isExpanded = true})
    : _background = UITheme.buttonGreen,
      _foreground = UITheme.buttonTextDark;

  const UIFAB.primaryDark(this.title, {super.key, required this.onTap, this.isDisabled = false, this.isExpanded = true})
    : _background = UITheme.buttonDarkGreen,
      _foreground = UITheme.buttonGreen;

  const UIFAB.text(this.title, {super.key, required this.onTap, this.isDisabled = false, this.isExpanded = true})
    : _background = Colors.transparent,
      _foreground = UITheme.buttonGreen;

  const UIFAB.grey(this.title, {super.key, required this.onTap, this.isDisabled = false, this.isExpanded = true})
    : _background = UITheme.buttonGrey,
      _foreground = UITheme.buttonTextLight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(32.0),
      child: Ink(
        width: isExpanded ? double.infinity : null,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        decoration: BoxDecoration(color: _background, borderRadius: BorderRadius.circular(32.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w500, color: isDisabled ? UITheme.background : _foreground, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
