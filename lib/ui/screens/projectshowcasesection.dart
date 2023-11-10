import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';
import 'package:portfolio/ui/widgets/project_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      color: Theme.of(context).colorScheme.background,
      padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.only(top: 50, left: 0, right: 0),
        desktop: const EdgeInsets.only(top: 50, left: 50, right: 50),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: getValueForScreenType(
                  context: context,
                  mobile: kContentPaddingFromLeftMobileDouble,
                  desktop: kContentPaddingFromLeftDouble - 50),
            ),
            child: Text(
              "My Projects",
              style: kBoldTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            children: [
              getValueForScreenType(
                context: context,
                mobile: const SizedBox(),
                desktop: ArrowButton(
                  onClick: scroll,
                  direction: ArrowDirection.left,
                ),
              ),
              SizedBox(
                width: getValueForScreenType(
                  context: context,
                  mobile: kContentPaddingFromLeftMobileDouble,
                  desktop: 20,
                ),
              ),
              Expanded(
                child: SizedBox(
                  //width: MediaQuery.of(context).size.width * 3 / 4,
                  height: MediaQuery.of(context).size.height *
                      getValueForScreenType(
                        context: context,
                        mobile: 0.5,
                        desktop: 0.45,
                      ),
                  child: ListView.builder(
                    controller: sc,
                    scrollDirection: Axis.horizontal,
                    itemCount: projectsList.length,
                    itemBuilder: (context, index) {
                      return ProjectCard(project: projectsList[index]);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20),
              getValueForScreenType(
                context: context,
                mobile: const SizedBox(),
                desktop: ArrowButton(
                  onClick: scroll,
                  direction: ArrowDirection.right,
                ),
              ),
            ],
          ),
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
      alignment: getValueForScreenType(
        context: context,
        mobile: const Alignment(0, -0.2),
        desktop: const Alignment(0, -0.1),
      ),
      child: IconButton(
          onPressed: () => onClick(direction),
          icon: Icon(
            direction == ArrowDirection.left
                ? Icons.chevron_left_outlined
                : Icons.chevron_right_outlined,
            size: getValueForScreenType(
              context: context,
              mobile: 35,
              desktop: 50,
            ),
          )),
    );
  }
}
