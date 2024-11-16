import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      selectedLabelStyle: TextStyle(color: Colors.black),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.list_bullet,
              color: Colors.black,
            ),
            label: "CATEGORY"),
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart,
              color: Colors.black,
            ),
            label: "ACCOUNT")
      ],
    ),
  );
}
