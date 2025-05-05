import 'package:flutter/material.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class UIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<IconData> actionIcons;
  final List<IconData> leadingIcons;

  const UIAppBar({super.key, required this.title, this.centerTitle = false, this.actionIcons = const [], this.leadingIcons = const []});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      leadingWidth: leadingIcons.isEmpty ? 56 : 112,
      leading:
          leadingIcons.isEmpty
              ? null
              : Row(children: leadingIcons.map((e) => IconButton(onPressed: () {}, icon: Icon(e, color: UITheme.iconsGrey))).toList()),
      actions: actionIcons.map((e) => IconButton(onPressed: () {}, icon: Icon(e, color: UITheme.iconsGrey))).toList(),
      title: Text(title, style: TextStyle(color: UITheme.buttonTextLight, fontSize: 18, fontWeight: FontWeight.w600)),
      surfaceTintColor: UITheme.background,
      backgroundColor: UITheme.background,
      foregroundColor: UITheme.iconsGrey,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
