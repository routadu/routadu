import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onBackground,
      padding: KHorizontalContentPadding.copyWith(top: 50, right: 250),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "About Me",
            style: kBoldTextStyle,
          ),
          const SizedBox(height: 80),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Image.asset('assets/images/profile-portrait.png'),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kAboutMeString,
                          style: kBodySmallTextStyle,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 40),
                        const AboutTabView(),
                        const SizedBox(height: 30),
                        const SizedBox(
                          height: 100,
                          child: TabBarView(
                            children: [
                              Text("Skills"),
                              Text("Education"),
                              Text("Experience"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutTabView extends StatelessWidget {
  const AboutTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        child: TabBar(
          isScrollable: true,
          tabs: const [
            Text("Skills"),
            Text("Education"),
            Text("Experience"),
          ],
          labelPadding: const EdgeInsets.only(left: 0, right: 60),
          indicatorPadding: const EdgeInsets.only(top: 10, right: 20),
          dividerColor: Colors.transparent,
          indicatorWeight: 2,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w900),
          labelColor: Colors.grey.shade400,
          unselectedLabelColor: Colors.grey.shade400,
        ),
      ),
    );
  }
}

class SkillsTab extends StatelessWidget {
  const SkillsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [],
    );
  }
}
