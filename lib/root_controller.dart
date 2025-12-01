import 'package:flutter/material.dart';

import 'constants.dart';
import 'home/home_controller.dart';

class RootController extends StatefulWidget {
  const RootController({super.key});

  @override
  State<RootController> createState() => _RootControllerState();
}

class _RootControllerState extends State<RootController> {

  int _currentIndex= 0;

  final List<StatefulWidget> _pageviews = [
    HomeController(),
    HomeController(),
    HomeController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pageviews[_currentIndex],                 // 动态切换页面
      bottomNavigationBar: BottomNavigationBar(   // 系统控件
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,      // 固定样式（可选）
        selectedItemColor: Constants.selectedModelBgColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Constants.darkThemeColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'SetUp',
          ),
        ],
      ),
    );
  }
}
