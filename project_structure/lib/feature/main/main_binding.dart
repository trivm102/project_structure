import 'dart:ffi';

import 'package:get/get.dart';
import 'package:project_structure/data/api/api_client.dart';
import 'package:project_structure/feature/main/main_controller.dart';
import 'package:project_structure/navigation/main_navigation_imp.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => MainNavigationImp());
  }
}

// class MainBinding  {

//   static Future<void> init() async {
//     Get.lazyPut(() => MainController());
//   }
// }