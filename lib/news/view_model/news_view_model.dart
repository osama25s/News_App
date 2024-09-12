import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  final NewsRepository newsRepository;

  List<Article> newsList = [];
  String? errormessage;
  bool isloading = false;

  NewsViewModel()
      : newsRepository = NewsRepository(ServiceLocator.newsDatasource);

  Future<void> getNews(String sourcesId) async {
    isloading = true;
    notifyListeners();
    try {
      newsList = await newsRepository.getNews(sourcesId);
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
