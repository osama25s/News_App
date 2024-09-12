import 'package:news_app/news/data/data_source/news_dataSource.dart';

class NewsRepository {
  final NewsDatasource newsDatasource;
  NewsRepository(this.newsDatasource);
  getNews(String sourceId) {
    return newsDatasource.getNews(sourceId);
  }
}
