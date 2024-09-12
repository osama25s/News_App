import 'package:collection/collection.dart';

class Sourcenews {
  final String? id;
  final String? name;

  const Sourcenews({this.id, this.name});

  factory Sourcenews.fromJson(Map<String, dynamic> json) => Sourcenews(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );
}
