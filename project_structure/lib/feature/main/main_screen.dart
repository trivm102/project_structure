import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/feature/alerts/alerts_page.dart';
import 'package:project_structure/feature/home/home_page.dart';
import 'package:project_structure/feature/login/login_screen.dart';
import 'package:project_structure/feature/main/main_controller.dart';
import 'package:project_structure/feature/news/news_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex, 
            children: [
              NewsPage(), 
              AlertsPage(),
              HomePage()],)),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(icon: CupertinoIcons.news, label: 'News'),
              _bottomNavigationBarItem(icon: CupertinoIcons.bell, label: 'Alerts'),
              _bottomNavigationBarItem(icon: CupertinoIcons.home, label: 'Home'),
            ],
          ),
      );
    },);
  }
}

_bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
}