import 'package:get/get.dart';
import 'package:project_structure/feature/login/login_binding.dart';
import 'package:project_structure/feature/login/login_screen.dart';
import 'package:project_structure/feature/main/main_binding.dart';
import 'package:project_structure/feature/main/main_controller.dart';
import 'package:project_structure/feature/main/main_screen.dart';
import 'package:project_structure/navigation/main_navigation.dart';

class MainNavigationImp extends MainNavigation {

  @override
  void gotoMainScreen() {
    // MainBinding.init();
    Get.offAll(() => const MainScreen(), binding: MainBinding());
  }

  @override
  void gotoLogin() {
    Get.to(() => LoginScreen(), binding: LoginBinding());
  }
}