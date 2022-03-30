import 'dart:convert';

import 'package:get/get.dart';
import '../services/app_exceptions.dart';
import '../services/base_client.dart';
import '../views/dialogs/dialog_helper.dart';
import 'base_controller.dart';

class TestController extends GetxController with BaseController {
  final baseClient = BaseClient();

  void getData() async {
    showLoading('Fetching data');
    var response = await baseClient.get('https://jsonplaceholder.typicode.com', '/todos/1').catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postData() async {
    var request = {'customer': '0398558833', 
                  'password': '@Aa123123'};
    showLoading('Posting data...');
    var response = await baseClient.post('/sessions', request).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
    print(response);
  }
}
