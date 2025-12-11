import 'package:flutter/material.dart';

class SandwichAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? leading;
  final TextStyle? titleStyle;

  const SandwichAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.leading,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(title, style: titleStyle),
      actions: actions,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
