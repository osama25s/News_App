import 'package:news_app/sources/data/models/Source.dart';

abstract class SourcesDatasource {
  Future<List<Source>> getSources(String categoryId);
}
