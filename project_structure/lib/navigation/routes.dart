
import 'package:get/get.dart';
import 'package:project_structure/feature/login/login_binding.dart';
import 'package:project_structure/feature/login/login_screen.dart';
import 'package:project_structure/feature/main/main_binding.dart';
import 'package:project_structure/feature/main/main_screen.dart';

class AppPages {
  static var list =[GetPage(name: AppRoutes.LOGIN, page: ()  => LoginScreen(), binding: LoginBinding()),
                    GetPage(name: AppRoutes.MAIN, page: ()  => MainScreen(), binding: MainBinding())];
}

class AppRoutes {
  static const String LOGIN = '/login';
  static const String MAIN = '/main';
}