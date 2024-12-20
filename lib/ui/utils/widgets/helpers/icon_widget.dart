import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final Icon icon;
  final dynamic navigationComponent;

  const IconWidget({super.key, required this.icon, this.navigationComponent});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => navigationComponent),
            (route) => false,
          );
        },
        icon: icon);
  }
}
