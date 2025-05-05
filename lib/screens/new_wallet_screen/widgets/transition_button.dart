import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class TransitionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool showBeta;
  final VoidCallback? onTap;

  final bool _isSmall;

  const TransitionButton({super.key, required this.title, required this.icon, this.onTap, this.showBeta = false}) : _isSmall = false;
  const TransitionButton.small({super.key, required this.title, required this.icon, this.onTap, this.showBeta = false}) : _isSmall = true;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(color: UITheme.buttonGrey.withAlpha(140), borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: _isSmall ? 64.0 : 86.0,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 46.0,
                width: 46.0,
                decoration: BoxDecoration(color: UITheme.buttonGreen.withAlpha(20), borderRadius: BorderRadius.circular(100.0)),
                child: Icon(icon, color: UITheme.buttonGreen),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Row(
                  children: [
                    Flexible(child: Text(title, style: TextStyle(color: UITheme.buttonTextLight, fontSize: 16.0))),
                    if (showBeta) ...[
                      SizedBox(width: 4.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                        decoration: BoxDecoration(color: UITheme.buttonTextLight, borderRadius: BorderRadius.circular(4.0)),
                        child: Text('Beta', style: TextStyle(color: UITheme.dialogBg, fontSize: 10.0)),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right_rounded, color: UITheme.textDarkGrey),
            ],
          ),
        ),
      ),
    );
  }
}
