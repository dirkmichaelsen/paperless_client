import 'package:paperless_client/model/tag.dart';

class TagResult {
  final int count;
  final String? next;
  final String? previous;
  final List<Tag> tags;

  TagResult(this.count, this.next, this.previous, this.tags);

  factory TagResult.fromJson(Map<String, dynamic> json) {
    return TagResult(
      json['count'],
      json['next'],
      json['previous'],
      json['results']?.map<Tag>((json) => Tag.fromJson(json)).toList(),
    );
  }
}
