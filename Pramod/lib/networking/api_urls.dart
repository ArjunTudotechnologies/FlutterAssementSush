import 'package:flutter/foundation.dart';

class ApiUrls {
  static String get baseURL {
    if (kReleaseMode) {
      return "https://breakingbadapi.com/api/";
    } else {
      return "https://breakingbadapi.com/api/";
    }
  }
}
