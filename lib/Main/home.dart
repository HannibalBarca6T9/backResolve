import 'package:flutter/material.dart';
import 'package:resolve/Main/profile.dart';
import 'package:resolve/Main/projects.dart';

import 'Components/bottomNavItem.dart';
import 'Categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final menuItemList = const <MenuItem>[
    MenuItem(Icons.home, 'Categories'),
    MenuItem(Icons.work, 'Projects'),
    MenuItem(Icons.person_2_outlined, 'Profile'),
  ];
  int index = 0;
  final screens = [
    MainPage(),
    ProjectsPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            unselectedItemColor: const Color.fromARGB(255, 75, 74, 74),
            selectedItemColor: const Color(0xFF333A56),
            backgroundColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            currentIndex: index,
            onTap: (x) {
              setState(() {
                index = x;
              });
            },
            elevation: 16,
            showUnselectedLabels: true,
            items: menuItemList
                .map((MenuItem menuItem) => BottomNavigationBarItem(
                      icon: Icon(menuItem.iconData),
                      label: menuItem.text,
                    ))
                .toList()),
        body: IndexedStack(
          index: index,
          children: screens,
        ));
  }
}
