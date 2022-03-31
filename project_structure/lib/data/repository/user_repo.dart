


import 'package:get/get.dart';

abstract class UserRepo {
  Future<Response> getUser();
  Future<dynamic> login(dynamic payloadObj);
}