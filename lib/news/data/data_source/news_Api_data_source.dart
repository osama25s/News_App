import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/data_source/news_dataSource.dart';
import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/news/data/models/news_response.dart';

class NewsAPIDataSource extends NewsDatasource {
  @override
  Future<List<Article>> getNews(String sourceId) async {
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
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('failed to get news');
    }
  }
}
