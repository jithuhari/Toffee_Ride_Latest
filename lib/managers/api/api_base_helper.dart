import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'api_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = 'dev-api.toffeeride.com';
  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  http.Client client = http.Client();

  Future<dynamic> get(
      {required String endpoint,
      required Map<String, String> params,
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      var url = Uri.http(_baseUrl, endpoint, params);
      var response = await client.get(url, headers: headers ?? _headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String endpoint, Map<String, String> params) async {
    dynamic responseJson;
    try {
      print(jsonEncode(params));
      var url = Uri.http(_baseUrl, endpoint);
      var response =
          await client.post(url, headers: _headers, body: jsonEncode(params));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
