import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/sources/data/models/sourcesResponse.dart';

class SourcesDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
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
    return SourcesResponse.fromJson(json);
  }
}
