import 'package:flutter/material.dart';
import 'package:portfolio/models/project/project.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final buttonShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)));
  bool isSourceCodePresent = false;
  bool isLiveDemoLinkPresent = false;
  bool areBothLinksPresent = false;
  bool isFocused = false;
  final normalState = Matrix4.identity();
  final hoverState = Matrix4.identity()
    ..scale(1.05)
    ..translate(-5, -5);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSourceCodePresent = widget.project.sourceCodeLink != null;
    isLiveDemoLinkPresent = widget.project.liveDemoLink != null;
    areBothLinksPresent = isSourceCodePresent && isLiveDemoLinkPresent;
  }

  void onHover(bool val) {
    isFocused = val;
    setState(() {});
  }

  void openLiveDemo() {
    widget.project.liveDemoLink;
  }

  void openSourceCode() {
    widget.project.sourceCodeLink;
  }

  void openTechWebsite() {
    widget.project.technologiesUsed[0].website;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: AnimatedContainer(
        transform: isFocused ? hoverState : normalState,
        margin: const EdgeInsets.only(right: 30),
        duration: const Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width /
            getValueForScreenType(
              context: context,
              mobile: 2,
              desktop: 5.5,
            ),
        child: Card(
          color: Theme.of(context).colorScheme.background,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 30),
                Text(
                  widget.project.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const Expanded(child: SizedBox(height: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      widget.project.technologiesUsed.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: openTechWebsite,
                        child: Tooltip(
                          message: widget.project.technologiesUsed[index].name,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.transparent,
                            foregroundImage: NetworkImage(
                              widget.project.technologiesUsed[index].assetURL,
                              scale: 0.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: areBothLinksPresent
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.end,
                  children: [
                    isSourceCodePresent
                        ? OutlinedButton(
                            onPressed: openSourceCode,
                            style: OutlinedButton.styleFrom(shape: buttonShape),
                            child: const Text("Source"),
                          )
                        : const SizedBox(),
                    isLiveDemoLinkPresent
                        ? FilledButton(
                            onPressed: openLiveDemo,
                            style: FilledButton.styleFrom(shape: buttonShape),
                            child: const Text("View"),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
