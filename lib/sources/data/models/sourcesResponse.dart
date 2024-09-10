import 'package:news_app/sources/data/models/Source.dart';

class SourcesResponse {
  SourcesResponse({
    required this.status,
    required this.sources,
  });

  final String? status;
  final List<Source> sources;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json["status"],
      sources: json["sources"] == null
          ? []
          : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
    );
  }
}
