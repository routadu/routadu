class Tech {
  final String name;
  final String website;
  final String assetURL;

  const Tech({
    required this.name,
    required this.website,
    required this.assetURL,
  });

  factory Tech.fromMap(Map<String, String> map) {
    return Tech(
      name: map['name'] ?? "",
      website: map['website'] ?? '',
      assetURL: map['assetURL'] ?? '',
    );
  }

  @override
  String toString() {
    return name;
  }
}
