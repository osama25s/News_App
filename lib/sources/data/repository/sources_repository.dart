import 'package:news_app/sources/data/data_source/sources_dataSource.dart';

class SourcesRepository {
  final SourcesDatasource sourcesDatasource;

  SourcesRepository(this.sourcesDatasource);

  getSources(String categoryId) {
    return sourcesDatasource.getSources(categoryId);
  }
}
