import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/feature/main/main_controller.dart';
import 'package:project_structure/feature/news/news_controller.dart';
import 'package:project_structure/navigation/main_navigation.dart';
import 'package:project_structure/navigation/main_navigation_imp.dart';

class NewsPage extends GetView<NewsController> {
  late MainNavigation mainNavigation = Get.find<MainNavigationImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children:[
            Text(
            "News Page",
            style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () {
              mainNavigation.gotoLogin();
            }, child: const Text('Login')),
          ]
        ),
      ),
    );
  }
}
