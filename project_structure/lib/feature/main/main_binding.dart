import 'package:get/get.dart';
import 'package:project_structure/data/api/api_client.dart';
import 'package:project_structure/feature/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => MainController());
  }
}