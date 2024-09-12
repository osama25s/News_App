import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/sources/data/data_source/sources_dataSource.dart';
import 'package:news_app/sources/data/models/Source.dart';
import 'package:news_app/sources/data/models/sourcesResponse.dart';

class SourcesApiDataSource extends SourcesDatasource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiContants.baseurl,
      ApiContants.sourcesendpoint,
      {
        'apikey': ApiContants.key,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('failed to get sources');
    }
  }
}
