import 'package:get/get.dart';
import 'package:project_structure/app/app_controller.dart';
import 'package:project_structure/feature/login/login_binding.dart' as login_binding;

import '../data/api/api_client.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => AppController());
    await login_binding.init();
  }
}