import 'package:flutter/material.dart';

class SignUpAvatar extends StatelessWidget {
  Color backgroundColor, iconColor;
  IconData avatarIcon;
  SignUpAvatar(
      {super.key,
      required this.backgroundColor,
      required this.avatarIcon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Icon(
        avatarIcon,
        size: 40,
        color: iconColor,
      ),
    );
  }
}
