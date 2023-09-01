import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';
import 'package:portfolio/ui/widgets/project_card.dart';

class ProjectShowcaseSection extends StatefulWidget {
  const ProjectShowcaseSection({super.key});

  @override
  State<ProjectShowcaseSection> createState() => _ProjectShowcaseSectionState();
}

class _ProjectShowcaseSectionState extends State<ProjectShowcaseSection> {
  ScrollController sc = ScrollController();

  void scroll(ArrowDirection direction) {
    final double oset =
        sc.offset + (direction == ArrowDirection.left ? -500 : 500);
    sc.animateTo(
      oset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onBackground,
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          ArrowButton(onClick: scroll, direction: ArrowDirection.left),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "My Projects",
                  style: kBoldTextStyle,
                ),
                const SizedBox(height: 80),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    controller: sc,
                    scrollDirection: Axis.horizontal,
                    itemCount: projectsDummyList.length,
                    itemBuilder: (context, index) {
                      return ProjectCard(project: projectsDummyList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          ArrowButton(onClick: scroll, direction: ArrowDirection.right),
        ],
      ),
    );
  }
}

enum ArrowDirection { left, right }

class ArrowButton extends StatelessWidget {
  final Function(ArrowDirection) onClick;
  final ArrowDirection direction;

  const ArrowButton(
      {super.key, required this.onClick, required this.direction});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.1),
      child: IconButton(
          onPressed: () => onClick(direction),
          icon: Icon(
            direction == ArrowDirection.left
                ? Icons.chevron_left_outlined
                : Icons.chevron_right_outlined,
            size: 50,
          )),
    );
  }
}
