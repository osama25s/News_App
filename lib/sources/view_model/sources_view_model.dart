import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/repository/sources_repository.dart';
import 'package:news_app/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  late final SourcesRepository sourcesRepository;
  SourcesViewModel() : super(SourcesInitial()) {
    sourcesRepository = SourcesRepository(ServiceLocator.sourcesDatasource);
  }
  Future<void> getSources(String categoryId) async {
    emit(LoadingGetSources());
    try {
      final sources = await sourcesRepository.getSources(categoryId);
      emit(SuccessGetSources(sources));
    } catch (error) {
      emit(ErrorGetSources(error.toString()));
    }
  }
}

