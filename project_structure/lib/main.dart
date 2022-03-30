import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/helper/dependencies.dart';
import 'package:project_structure/views/pages/login_screen.dart';
import 'package:project_structure/views/pages/test_page.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}