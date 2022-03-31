import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/app/app_binding.dart';
import 'package:project_structure/feature/login/login_binding.dart';
import 'package:project_structure/feature/login/login_screen.dart';
import 'package:project_structure/feature/main/main_binding.dart';
import 'package:project_structure/feature/main/main_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      title: 'Structure Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: AppRoutes.LOGIN,
    );
  }
}

class AppPages {
  static var list = [ GetPage(name: AppRoutes.LOGIN, page: ()  => LoginScreen(), binding: LoginBinding())];
}

class AppRoutes {
  static const String LOGIN = '/login';
}