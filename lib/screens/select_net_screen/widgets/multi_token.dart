import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/models/token_enum.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class MultiToken extends StatelessWidget {
  const MultiToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: UITheme.ui24,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(width: 1, color: UITheme.buttonGreen),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            height: 74.0,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(99.0),
                  child: SizedBox(height: 46.0, width: 46.0, child: Image.asset(Token.avalanche.iconPath)),
                ),
                SizedBox(width: 12.0),
                Expanded(child: Text('Мультимонетный кошелек', style: TextStyle(color: UITheme.buttonTextLight, fontSize: 16.0))),
                Icon(Icons.keyboard_arrow_right_rounded, color: UITheme.iconsGrey),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: -8,
            child: Container(
              height: 16,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(color: UITheme.buttonGreen, borderRadius: BorderRadius.circular(16.0)),
              child: Text('Рекомендуется', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
