// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:music_app/data_api/data_api.dart';

import 'api_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseApiClient {
  static const int TIME_OUT_DURATION = 20;
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer ${DataApi.accessToken}',
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
        var responseJson = jsonDecode(response.body);
        String message = responseJson["message"];
        throw BadRequestException(message, response.request!.url.toString());
      case 401:
      case 403:
        var responseJson = jsonDecode(response.body);
        String message = responseJson["message"];
        throw UnauthorizedException(message, response.request!.url.toString());
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
