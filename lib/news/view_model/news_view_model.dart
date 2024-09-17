import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/news/view_model/news_states.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsStates> {
  late final NewsRepository newsRepository;

  NewsViewModel() : super(initialState()) {
    newsRepository = NewsRepository(ServiceLocator.newsDatasource);
  }

  Future<void> getNews(String sourcesId) async {
    emit(LoadinNews());
    try {
      final newsList = await newsRepository.getNews(sourcesId);
      emit(SuccessNews(newsList));
    } catch (error) {
      emit(ErrorNews(error.toString()));
    }
  }
}
