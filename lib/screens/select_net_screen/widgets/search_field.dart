import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: UITheme.ui24, borderRadius: BorderRadius.circular(16.0)),
      height: 32.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search_rounded, color: UITheme.iconsGrey),
          SizedBox(width: 16.0),
          Text('Поиск', style: TextStyle(color: UITheme.iconsGrey, fontSize: 14.0)),
        ],
      ),
    );
  }
}
