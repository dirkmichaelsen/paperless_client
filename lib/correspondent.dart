class Correspondent {
  final int id;
  final String slug;
  final String name;
  final String match;
  final int matchingAlgorithm;
  final bool isInsensitive;
  final int documentCount;
  final String? lastCorrespondence; // TODO change this to DateTime later!

  Correspondent(
      this.id,
      this.slug,
      this.name,
      this.match,
      this.matchingAlgorithm,
      this.isInsensitive,
      this.documentCount,
      this.lastCorrespondence);

  Correspondent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        slug = json['slug'],
        name = json['name'],
        match = json['match'],
        matchingAlgorithm = json['matching_algorithm'],
        isInsensitive = json['is_insensitive'],
        documentCount = json['document_count'],
        lastCorrespondence = json['last_correspondence'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'match': match,
        'matching_algorithm': matchingAlgorithm,
        'is_insensitive': isInsensitive,
        'document_count': documentCount,
        'last_correspondence': lastCorrespondence,
      };
}
