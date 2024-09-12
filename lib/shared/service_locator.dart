import 'package:news_app/news/data/data_source/news_Api_data_source.dart';
import 'package:news_app/news/data/data_source/news_dataSource.dart';
import 'package:news_app/sources/data/data_source/sources_Api_dataSourse.dart';
import 'package:news_app/sources/data/data_source/sources_dataSource.dart';

class ServiceLocator {
  static NewsDatasource newsDatasource = NewsAPIDataSource();
  static SourcesDatasource sourcesDatasource = SourcesApiDataSource();
}
