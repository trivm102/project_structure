import 'dart:convert';

import 'package:project_structure/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:project_structure/data/repository/user_repo.dart';
import 'package:project_structure/services/app_exceptions.dart';
import 'package:project_structure/services/base_client.dart';
import 'package:project_structure/views/dialogs/dialog_helper.dart';

class LoginController extends GetxController with BaseController {
  //final baseClient = BaseClient();
  final baseClient = Get.find<BaseClient>();

  final UserRepo userRepo;

  LoginController({required this.userRepo});

  // void postData(String phoneNumber, String password) async {
  //   var request = {'customer': phoneNumber, 
  //                 'password': password};
  //   showLoading('Posting data...');
  //   var response = await baseClient.post('/sessions', request).catchError((error) {
  //     if (error is BadRequestException) {
  //       var apiError = json.decode(error.message!);
  //       DialogHelper.showErroDialog(description: apiError["reason"]);
  //     } else {
  //       handleError(error);
  //     }
  //   });
  //   if (response == null) return;
  //   hideLoading();
  //   print(response);
  // }

  void login(String phoneNumber, String password) async {
    var request = {'customer': phoneNumber, 
                  'password': password};
    showLoading('Posting data...');
    var response = await userRepo.login(request).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
    print(response.body);
  }
}