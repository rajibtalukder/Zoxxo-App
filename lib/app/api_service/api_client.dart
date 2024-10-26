import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

class ApiClient {
  String baseUrl = dotenv.env['base_url'] ?? '';

  //GET
  Future<dynamic> get(String endPoint, {dynamic header, dynamic query}) async {
    var uri = Uri.parse(baseUrl + endPoint).replace(queryParameters: query);
    try {
      var response =
      await http.get(uri, headers: header).timeout(const Duration(seconds: 20));
      print("---------------------");
      print(uri);
      print(response.body);
      print("---------------------");
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, dynamic payloadObj,
      {dynamic header}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    try {
      print('-------1');
      var response = await http
          .post(uri, body: payloadObj, headers: header)
          .timeout(const Duration(seconds: 20));

      print('-------1');
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //PUT
  Future<dynamic> put(String endPoint, dynamic payloadObj,
      {dynamic header}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    try {
      var response = await http
          .put(uri, body: payloadObj, headers: header)
          .timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //DELETE
  Future<dynamic> delete(String endPoint, {dynamic header, dynamic query}) async {
    var uri = Uri.parse(baseUrl + endPoint).replace(queryParameters: query);
    try {
      var response = await http.delete(uri, headers: header)
      // .put(uri, body: payloadObj, headers: header)
          .timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }






  dynamic _processResponse(http.Response response) {
    var jsonResponse = utf8.decode(response.bodyBytes);
    // print(response.statusCode);
    // print(response.request!.url);

    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 201:
        return jsonResponse;
      case 400:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      case 401:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      case 500:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      default:
        throw ProcessDataException(
            "Error occurred with code ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}

