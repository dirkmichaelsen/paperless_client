import 'package:paperless_client/correspondent.dart';

class CorrespondentResult {
  final int count;
  final String? next;
  final String? previous;
  final List<Correspondent> correspondents;

  CorrespondentResult(this.count, this.next, this.previous, this.correspondents);

  factory CorrespondentResult.fromJson(Map<String, dynamic> json) {
    return CorrespondentResult(
      json['count'],
      json['next'],
      json['previous'],
      json['results']
          ?.map<Correspondent>((json) => Correspondent.fromJson(json))
          .toList(),
    );
  }
}
