import 'package:flutter/material.dart';
import 'package:portfolio/models/project/project.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:html' as html;

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
  bool sourceCodeButtonEnabled = false;
  bool isLiveDemoLinkPresent = false;
  bool liveDemoButtonEnabled = false;
  bool areBothLinksPresent = false;
  bool isFocused = false;
  final normalState = Matrix4.identity()..scale(0.95);
  final hoverState = Matrix4.identity()
    ..scale(1)
    ..translate(-5, -5);

  @override
  void initState() {
    super.initState();
    isSourceCodePresent = widget.project.sourceCodeLink != null;
    sourceCodeButtonEnabled = widget.project.sourceCodeLink != "";
    isLiveDemoLinkPresent = widget.project.liveDemoLink != null;
    liveDemoButtonEnabled = widget.project.liveDemoLink != "";
    areBothLinksPresent = isSourceCodePresent && isLiveDemoLinkPresent;
  }

  void onHover(bool val) {
    isFocused = val;
    setState(() {});
  }

  void openLiveDemo() {
    html.window.open(widget.project.liveDemoLink ?? "", 'new tab');
  }

  void openSourceCode() {
    html.window.open(widget.project.sourceCodeLink ?? "", 'new tab');
  }

  void openTechWebsite(int index) {
    html.window.open(widget.project.technologiesUsed[index].website, 'new tab');
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
              mobile: 1.5,
              desktop: 5.5,
            ),
        height: getValueForScreenType(
          context: context,
          mobile: MediaQuery.of(context).size.height / 5,
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
              mainAxisSize: MainAxisSize.min,
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
                        onTap: () => openTechWebsite(index),
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
                            onPressed:
                                sourceCodeButtonEnabled ? openSourceCode : null,
                            style: OutlinedButton.styleFrom(shape: buttonShape),
                            child: const Text("Source"),
                          )
                        : const SizedBox(),
                    isLiveDemoLinkPresent
                        ? FilledButton(
                            onPressed:
                                liveDemoButtonEnabled ? openLiveDemo : null,
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
