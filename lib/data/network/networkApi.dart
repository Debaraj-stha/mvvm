import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mvvm/data/appException.dart';
import 'package:mvvm/data/network/baseApi.dart';
import 'package:http/http.dart' as http;

class NetworkAPI extends BaseAPI {
  @override
  Future GETRequest(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("NO internet connection");
    }
    return responseJson;
  }

  @override
  Future POSTRequest(String url, data) async {
    dynamic responseData;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseData = returnResponse(response);
    } on SocketException {
      throw FetchDataException("NO internet connection");
    }
    return responseData;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return BadRequestException(response.body.toString());
      case 404:
        return UnAuthorizedRequest(response.body.toString());
      case 500:
        return InternalServerError(response.body.toString());
      default:
        throw FetchDataException(
            "Error occured while fetching data with statuscode ${response.statusCode}.Message:${response.body}");
    }
  }
}
