import 'package:flutter_purpose/model/bad_model.dart';
import 'package:flutter_purpose/networking/http_client.dart';
import 'dart:async';
import 'dart:convert';

class PurposeRepository {
  Future<dynamic> fetchBadCharacters(int pageNumber,int pageSize) async {
    final httpClient = HttpClient();
    final response = await httpClient.fetchData('characters?limit=$pageSize&offset=$pageNumber');
    return response;
  }
}