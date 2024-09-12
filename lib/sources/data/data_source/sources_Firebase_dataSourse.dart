import 'package:news_app/sources/data/data_source/sources_dataSource.dart';
import 'package:news_app/sources/data/models/Source.dart';

class SourcesFirebaseDatasourse extends SourcesDatasource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    return [];
  }
}
