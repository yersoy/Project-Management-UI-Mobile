import 'package:cilekhavuz/utils/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final Widget? trailing;
  final String? title;
  final Widget? leading;

  const Header({Key? key, this.trailing, this.title, this.leading}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      contentPadding: EdgeInsets.only(top: 25, bottom: 5, left: leading != null ? 0 : 10),
      title: Text(
        title != null ? title! : Titles.APP_TITLE,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 24, color: Colors.black),
      ),
      trailing: trailing,
    );
  }
}
