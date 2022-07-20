import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'http_service.dart';
import 'httpexception.dart';

///implementation of http service
class HttpServiceRequests implements HttpService {
  ///implementatiojn of get method
  @override
  Future<dynamic> get(String uri) async {
    dynamic responseJson;
    try {
      final url = Uri.parse(uri);
      final response = await http.get(url);

      responseJson = await ResponseException().responseException(response);
    } on SocketException {
      throw Get.snackbar("Network error", "No internet connection");
    }
    return responseJson;
  }
}
