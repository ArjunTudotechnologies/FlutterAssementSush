import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'api_exception.dart';
import 'api_urls.dart';
import 'package:http/http.dart' as http;

class HttpClient {

  HttpClient._();

  static final HttpClient _instance =  HttpClient._();

  factory HttpClient(){
    return _instance;
  }


  Future<dynamic> fetchData(String url, {Map<String, String>? params}) async {
    var responseJson;

    var uri = ApiUrls.baseURL + url + ((params != null) ? this.queryParameters(params) : "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.get(Uri.parse(uri), headers: header);
      print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response =
      await http.post(Uri.parse(ApiUrls.baseURL + url), body: body, headers: header);
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
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred: ${response.statusCode}');
    }
  }

}