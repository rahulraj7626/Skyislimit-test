import 'dart:convert';
import 'package:http/http.dart' as http;

import '../common_widgets/show_error.dart';

///handlibg api eceptions
class ResponseException {
  Future<dynamic> responseException(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 404:
        return ErrorPopus().errorAlert("Error", "Something eror");
      default:
        var responseJson = json.decode(response.body);
        return responseJson;
    }
  }
}