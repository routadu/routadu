class AboutInfoTileData {
  final String title;
  final String secondaryText;
  final String? tertiaryText;
  final String? link;

  AboutInfoTileData({
    required this.title,
    required this.secondaryText,
    this.tertiaryText,
    this.link,
  });
}
