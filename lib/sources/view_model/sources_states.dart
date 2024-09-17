import 'package:news_app/sources/data/models/Source.dart';

abstract class SourcesStates {}

class SourcesInitial extends SourcesStates {}

class LoadingGetSources extends SourcesStates {}

class SuccessGetSources extends SourcesStates {
  List<Source> sources;
  SuccessGetSources(this.sources);
}

class ErrorGetSources extends SourcesStates {
  final String errormessage;

  ErrorGetSources(this.errormessage);
}
