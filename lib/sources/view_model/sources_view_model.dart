import 'package:flutter/material.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/data_source/sources_Api_dataSourse.dart';
import 'package:news_app/sources/data/models/Source.dart';
import 'package:news_app/sources/data/repository/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  final SourcesRepository sourcesRepository;
  SourcesViewModel()
      : sourcesRepository = SourcesRepository(ServiceLocator.sourcesDatasource);
  List<Source> sources = [];
  String? errormessage;
  bool isloading = false;

  Future<void> getSources(String categoryId) async {
    isloading = true;
    notifyListeners();
    try {
      sources = await sourcesRepository.getSources(categoryId);
    } catch (error) {
      print(error.toString());
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
