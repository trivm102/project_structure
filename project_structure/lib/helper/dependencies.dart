import 'package:get/get.dart';
import 'package:project_structure/data/api/api_client.dart';
import 'package:project_structure/data/repository/user_repo.dart';
import 'package:project_structure/services/base_client.dart';

import '../controllers/login_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    //api client
    Get.lazyPut(() => ApiClient(appBaseUrl: 'http://api.saigonshippers.com'));
    Get.lazyPut(() => BaseClient());

    //repos
    Get.lazyPut(() => UserRepo(apiClient: Get.find()));

    //controllers
    Get.lazyPut(() => LoginController(userRepo: Get.find()));
  }
}

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'http://api.saigonshippers.com'));
  Get.lazyPut(() => BaseClient());

  //repos
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => LoginController(userRepo: Get.find()));
}
