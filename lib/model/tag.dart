class Tag {
  final int id;
  final String slug;
  final String name;
  final int colour;
  final String match;
  final int matchingAlgorithm;
  final bool isInsensitive;
  final bool isInboxTag;
  final int documentCount;

  Tag(
      this.id,
      this.slug,
      this.name,
      this.colour,
      this.match,
      this.matchingAlgorithm,
      this.isInsensitive,
      this.isInboxTag,
      this.documentCount);

  Tag.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        slug = json['slug'],
        name = json['name'],
        colour = json['colour'],
        match = json['match'],
        matchingAlgorithm = json['matching_algorithm'],
        isInsensitive = json['is_insensitive'],
        isInboxTag = json['is_inbox_tag'],
        documentCount = json['document_count'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'colour': colour,
        'match': match,
        'matching_algorithm': matchingAlgorithm,
        'is_insensitive': isInsensitive,
        'is_inbox_tag': isInboxTag,
        'document_count': documentCount,
      };
}
