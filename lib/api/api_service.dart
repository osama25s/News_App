import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/models/sourcesResponse.dart';

class ApiService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiContants.baseurl,
      ApiContants.sourcesendpoint,
      {
        'apikey': ApiContants.key,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(
      ApiContants.baseurl,
      ApiContants.newsendpoint,
      {
        'apikey': ApiContants.key,
        'sources': sourceId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> getsearchNews(String query) async {
    final uri = Uri.https(
      ApiContants.baseurl,
      ApiContants.newsendpoint,
      {
        'apikey': ApiContants.key,
        'q': query,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
