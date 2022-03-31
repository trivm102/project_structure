import 'package:get/get.dart';
import 'package:project_structure/feature/main/main_controller.dart';

import '../data/api/api_client.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ApiClient());
    // Get.lazyPut(() => MainController());
  }
}