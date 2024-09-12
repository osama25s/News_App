import 'package:news_app/news/data/data_source/news_dataSource.dart';
import 'package:news_app/news/data/models/article.dart';

class NewsFirebaseDataSource extends NewsDatasource {
  @override
  Future<List<Article>> getNews(String sourceId) async {
    return [];
  }
}
