import 'package:get/get.dart';
import 'package:project_structure/feature/login/login_binding.dart';
import 'package:project_structure/feature/login/login_screen.dart';
import 'package:project_structure/feature/main/main_binding.dart';
import 'package:project_structure/feature/main/main_controller.dart';
import 'package:project_structure/feature/main/main_screen.dart';
import 'package:project_structure/navigation/main_navigation.dart';
import 'package:project_structure/navigation/routes.dart';

class MainNavigationImp extends MainNavigation {

  @override
  void gotoMainScreen() {
    Get.offAllNamed(AppRoutes.MAIN);
  }

  @override
  void gotoLogin() {
    Get.toNamed(AppRoutes.LOGIN);
  }
}