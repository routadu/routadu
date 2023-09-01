import 'package:portfolio/models/tech/tech.dart';

class Project {
  final String title;
  final int id;
  final String imageURL;
  final String description;
  final List<Tech> technologiesUsed;
  final String? liveDemoLink;
  final String? sourceCodeLink;

  Project({
    required this.title,
    required this.id,
    required this.imageURL,
    required this.description,
    required this.technologiesUsed,
    this.liveDemoLink,
    this.sourceCodeLink,
  });
}
