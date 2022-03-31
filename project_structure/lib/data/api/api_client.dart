import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../utils/app_exceptions.dart';
class ApiClient extends GetConnect implements GetxService {
  //late String token;
  String token = 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiJhY0J5RXd3LVR0YW9MWFo0cW81MUV3IiwidHMiOjE2NDg3MjAxNDl9.CK4-bWUB54OEUJj-sBkYJh_NR5zbGQpH18377B-coIIh9Uuhpc3o2KUZLSgfw-RqO2qt6tcwzPLBYGEKUdd6PQ';
  late String appBaseUrl;
  late Map<String, String> _mainHeaders;


  ApiClient() {
    baseUrl = 'http://api.saigonshippers.com';
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Accept-Language': 'vi_VN',
        'Authorization': 'Bearer $token',
    };
  } 

  //GET
  Future<dynamic> getData(String url) async {
    try {
        Response response = await get(url, headers: _mainHeaders);
        return _processResponse(response);
    }catch(e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //POST
  Future<dynamic> postData(String url, dynamic payloadObj) async {
    try {
      print('POST: ${baseUrl ?? ''}$url');
      print('PAYLOAD: $payloadObj');
      Response response = await post(url, payloadObj, headers: _mainHeaders);
      print('DATA RESPONSE: ${response.bodyString}');
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', '${baseUrl ?? ''}$url');
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time',  '${baseUrl ?? ''}$url');
    }
  }

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response;
        return responseJson;
      case 201:
        var responseJson = response;
        return responseJson;
      case 400:
        throw BadRequestException(response.body['message'], response.request?.url.toString());
      case 401:
        throw FetchDataException(response.body['message'], response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(response.body['message'], response.request?.url.toString());
      case 422:
        throw BadRequestException(response.body['message'], response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}