import 'package:flutter/material.dart';
import 'package:icehockeyrobot/training/training_data_controller.dart';

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
    TrainingDataController(),
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
        items: [
          BottomNavigationBarItem(
            icon:  Padding(                       // 让图片居中
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'images/home/home_icon_active.png',
                width: 24,
                height: 24,
              ),
            ),
            activeIcon: Padding(padding: const EdgeInsets.all(0),
               child: Image.asset(
                 "images/home/home_icon_active.png",
                 width: 24,
                 height: 24,
               ),
            ),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon:  Padding(padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/home/training_icon.png",
                width: 24,
                height: 24,
              ),
            ),
            activeIcon: Padding(padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/home/training_icon_active.png",
                width: 24,
                height: 24,
              ),
            ),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Padding(padding: const EdgeInsets.all(0),
                     child: Image.asset(
                       "images/home/explore.png",
                       width: 24,
                       height: 24,
                      ),
                   ),
            activeIcon:  Padding(padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/home/explore_active.png",
                width: 24,
                height: 24,
              ),
            ),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
