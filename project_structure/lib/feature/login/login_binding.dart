import 'package:get/get.dart';
import 'package:project_structure/data/repository/user_repo_imp.dart';
import 'package:project_structure/feature/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepoImpl());
    Get.lazyPut(() => LoginController());
  }
}

// Future<void> init() async {
//     Get.lazyPut(() => UserRepoImpl());
//     Get.lazyPut(() => LoginController());
// }