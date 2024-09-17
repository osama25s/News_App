import 'package:news_app/news/data/models/article.dart';

abstract class NewsStates {}

class initialState extends NewsStates {}

class LoadinNews extends NewsStates {}

class SuccessNews extends NewsStates {
  final List<Article> newsList;

  SuccessNews(this.newsList);
}

class ErrorNews extends NewsStates {
  final String errormessage;

  ErrorNews(this.errormessage);
}
