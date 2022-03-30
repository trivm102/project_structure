


import 'package:get/get.dart';

import '../api/api_client.dart';

class UserRepo extends GetxService {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<Response> getUser() async {
    return await apiClient.getData("/me");
  }

  Future<Response> login(dynamic payloadObj) async {
    return await apiClient.postData("/sessions", payloadObj);
  }

}