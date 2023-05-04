import 'package:flutter/material.dart';

class SettingsListTiles extends StatelessWidget {
  IconData leading;
  String title, subtitle;
  SettingsListTiles(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(
        leading,
      ),
    );
  }
}
