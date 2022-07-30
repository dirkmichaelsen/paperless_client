import 'package:paperless_client/document_type.dart';
import 'package:paperless_client/tag.dart';

class DocumentTypeResult {
  final int count;
  final String? next;
  final String? previous;
  final List<DocumentType> documentTypes;

  DocumentTypeResult(this.count, this.next, this.previous, this.documentTypes);

  factory DocumentTypeResult.fromJson(Map<String, dynamic> json) {
    return DocumentTypeResult(
      json['count'],
      json['next'],
      json['previous'],
      json['results']
          ?.map<DocumentType>((json) => DocumentType.fromJson(json))
          .toList(),
    );
  }
}
