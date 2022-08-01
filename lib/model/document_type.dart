class DocumentType {
  final int id;
  final String slug;
  final String name;
  final String match;
  final int matchingAlgorithm;
  final bool isInsensitive;
  final int documentCount;

  DocumentType(this.id, this.slug, this.name, this.match,
      this.matchingAlgorithm, this.isInsensitive, this.documentCount);

  DocumentType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        slug = json['slug'],
        name = json['name'],
        match = json['match'],
        matchingAlgorithm = json['matching_algorithm'],
        isInsensitive = json['is_insensitive'],
        documentCount = json['document_count'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'match': match,
        'matching_algorithm': matchingAlgorithm,
        'is_insensitive': isInsensitive,
        'document_count': documentCount,
      };
}
