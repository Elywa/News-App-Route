class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Source.fromJson(Map<String, dynamic> data) => Source(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        url: data['url'] as String?,
        category: data['category'] as String?,
        language: data['language'] as String?,
        country: data['country'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'url': url,
        'category': category,
        'language': language,
        'country': country,
      };
}
