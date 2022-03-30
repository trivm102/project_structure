import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:project_structure/services/app_exceptions.dart';
class ApiClient extends GetConnect implements GetxService {
  //late String token;
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiJhY0J5RXd3LVR0YW9MWFo0cW81MUV3IiwiY3VzdG9tZXJfaWQiOiJVQ3pjYk5vQ1J5LTJoZ3hPTUZTcHh3IiwiZXhwIjoxNjUxMDczMDM2LCJzZXNzaW9uX2lkIjoiUkt3cGpIcmFTNmU3NTkyejBYUUVpdyJ9.mtqZo8q9xkRehPo07MzNFoGIdXoBsah6ue097x-bmBM';
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;


  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Accept-Language': 'vi_VN',
        'Authorization': 'Bearer $token',
    }; 
  } 

  //GET
  Future<Response> getData(String url) async {
    try {
        Response response = await get(url, headers: _mainHeaders);
        return response;
    }catch(e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //POST
  Future<dynamic> postData(String url, dynamic payloadObj) async {
    var payload = json.encode(payloadObj);
    try {
      Response response = await post(url, payload, headers: _mainHeaders);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', this.appBaseUrl + url);
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time',  this.appBaseUrl + url);
    }
  }

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.bodyString;
        return responseJson;
      case 201:
        var responseJson = response.bodyString;
        return responseJson;
      case 400:
        throw BadRequestException(response.bodyString, response.request!.url.toString());
      case 401:
        throw FetchDataException(response.bodyString, response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(response.bodyString, response.request!.url.toString());
      case 422:
        throw BadRequestException(response.bodyString, response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}