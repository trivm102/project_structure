import 'dart:convert';

import 'package:project_structure/core/base_controller.dart';
import 'package:get/get.dart';
import 'package:project_structure/data/repository/user_repo.dart';
import 'package:project_structure/data/repository/user_repo_imp.dart';

import '../../core/dialogs/dialog_helper.dart';
import '../../data/utils/app_exceptions.dart';

class LoginController extends GetxController with BaseController {
  //final baseClient = BaseClient();

  late UserRepo _userRepo;

  LoginController() {
    _userRepo = Get.find<UserRepoImpl>();
  }


  void login(String phoneNumber, String password) async {
    var request = {'customer': phoneNumber, 
                  'password': password};
    showLoading('Posting data...');
    await _userRepo.login(request).then((response) {
      hideLoading();
    }).catchError((error) {
      hideLoading();
      handleError(error);
    });
  }
}