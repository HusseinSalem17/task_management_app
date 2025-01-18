import 'package:flutter/material.dart';

AppBar customAppBar({
  required BuildContext context,
  required Icon icon,
  required Function() onPressed,
  List<Widget>? actions, // Optional actions parameter
}) {
  return AppBar(
    leading: IconButton(
      onPressed: onPressed,
      icon: icon,
    ),
    elevation: 0,
    actions: actions ??
        const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.jpeg'),
            radius: 18,
          ),
          SizedBox(
            width: 20,
          ),
        ],
    centerTitle: true,
  );
}
