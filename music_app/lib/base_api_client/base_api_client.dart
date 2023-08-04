import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'api_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseApiClient {
  static const int TIME_OUT_DURATION = 20;
  static const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGMwMGU4NmRhYTc5OWU4ZDI2NTUxOTUiLCJpYXQiOjE2OTEwNjE2MTAsImV4cCI6MTY5MTA2NzYxMCwidHlwZSI6ImFjY2VzcyJ9.W5n2Wb9NNdhpof4hBYqlAgn3-C0OSymp12N2xZE2b3Y';
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  //GET API Call
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);

    try {
      var response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .post(uri, headers: headers, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  Future<dynamic> put(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .put(uri, headers: headers, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  Future<dynamic> delete(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .delete(uri, headers: headers, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson as Map;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson as Map;
      case 400:
        throw BadRequestException(
            jsonDecode(response.body), response.request!.url.toString());
      case 401:
      case 403:
        throw UnauthorizedException(
            jsonDecode(response.body), response.request!.url.toString());
      case 404:
        throw NotFoundException(
            'Page not found with status code : ${response.statusCode}',
            response.request!.url.toString());
      case 500:
        throw FetchDataException(
            'Error occured with status code : ${response.statusCode}',
            response.request!.url.toString());
      default:
    }
  }
}
