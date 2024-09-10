import 'package:flutter/material.dart';
import 'package:news_app/sources/data/data_source/sources_dataSourse.dart';
import 'package:news_app/sources/data/models/Source.dart';

class SourcesViewModel with ChangeNotifier {
  final dataScource = SourcesDataSource();

  List<Source> sources = [];
  String? errormessage;
  bool isloading = false;

  Future<void> getSources(String categoryId) async {
    isloading = true;
    notifyListeners();
    try {
      final response = await dataScource.getSources(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources ?? [];
      } else {
        errormessage = 'failed to get sources';
      }
    } catch (error) {
      print(error.toString());
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
