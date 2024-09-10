import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();

  List<Article> newsList = [];
  String? errormessage;
  bool isloading = false;

  Future<void> getNews(String sourcesId) async {
    isloading = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(sourcesId);
      if (response.status == 'ok' && response.articles != null) {
        newsList = response.articles!;
      } else {
        errormessage = 'failed to get news';
      }
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
