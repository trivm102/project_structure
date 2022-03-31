
import 'package:get/get.dart';
import 'package:project_structure/data/api/api_client.dart';
import 'package:project_structure/data/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {

  late ApiClient _apiClient;

  UserRepoImpl() {
    _apiClient = Get.find<ApiClient>();
  }

  @override
  Future<Response> getUser() async {
    return await _apiClient.getData('/me');
  }

  @override
  Future<dynamic> login(dynamic payloadObj) async {
    var response = await _apiClient.postData('/sessions', payloadObj);
    return response;
  }
}