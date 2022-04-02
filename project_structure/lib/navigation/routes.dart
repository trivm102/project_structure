
import 'package:get/get.dart';
import 'package:project_structure/feature/login/login_binding.dart';
import 'package:project_structure/feature/login/login_screen.dart';

class AppPages {
  static var list = [ GetPage(name: AppRoutes.LOGIN, page: ()  => LoginScreen(), binding: LoginBinding())];
}

class AppRoutes {
  static const String LOGIN = '/login';
}