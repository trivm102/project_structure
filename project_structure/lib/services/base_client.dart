import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project_structure/services/secrets.dart';
import 'app_exceptions.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

class BaseClient {

  static final BaseClient _instance = BaseClient._internal();

  static const int TIME_OUT_DURATION = 20;

  String token = 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOiJhY0J5RXd3LVR0YW9MWFo0cW81MUV3IiwidHMiOjE2NDg2NTM3ODd9.ACl1x14O8JfOnL07uiGQFiLQ2yKdylqNl1vZedeWFtjlEMJObcorpKXWthUyu1DzfaFzPl-yY_hI0Cx07-98Qg';

  final String _apiBaseURL = 'http://api.saigonshippers.com';
  final String _clientID = secretClientID;
  Map<String, String>? _header;

  final HttpWithMiddleware _httpClient = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY)
  ]);

  factory BaseClient() {
    return _instance;
  }

  BaseClient._internal() {
    // initialization logic 
    _header = _apiHeaders();
  }


  Map<String, String>? _apiHeaders() {
    return <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Accept-Language': 'vi_VN',
        'Authorization': 'Bearer ' + token,
      };
  }
  //GET
  Future<dynamic> get(String baseUrl, String api) async {

    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await _httpClient.get(uri, headers: _header).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic payloadObj) async {
    var uri = Uri.parse(_apiBaseURL + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await _httpClient.post(uri, headers: _header, body: payload).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw FetchDataException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
  
  String _userAgent() {
    return 'GetJob Manager | Build Version: 1.0 | Version Code: 1';
  }

  String _generateClientToken() {
    final jwt = JWT(
      {
        'client_id': _clientID,
        'ts': (DateTime.now().millisecondsSinceEpoch / 1000).round()
      },
    );
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    print('JWT stringToBase64:\n ${stringToBase64.decode(secretClientPrivateKey)}');
    final key = ECPrivateKey(stringToBase64.decode(secretClientPrivateKey));

    String token = jwt.sign(key, algorithm: JWTAlgorithm.ES256);
    print('JWT ts: ${jwt.payload['ts']}');
    print('JWT init token: $token');


    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print('JWT decodedToken:\n ${decodedToken.toString()}');

    return token;
  }
}
