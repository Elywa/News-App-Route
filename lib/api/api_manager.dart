import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/source_response/resource_response.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=85d5590c8e9e49c8aaa2e1d995aab8d3
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(
      authorizySorceUrl,
      unencodedPathSourceUrl,
      {'apiKey': '85d5590c8e9e49c8aaa2e1d995aab8d3'},
    );

    try {
      Response response = await http.get(url); // response now is String
      // i want to change string to json
      var jsonResponse = jsonDecode(response.body);
      // now i want to change json to object
      var finalResponse = SourceResponse.fromMap(jsonResponse);

      return finalResponse;
    } catch (e) {
      throw e;
    }
  }


  static void getSourceNews(String sourceName) {
    
  }
}
