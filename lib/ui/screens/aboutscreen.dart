import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';
import 'package:portfolio/models/about_info_tile_data/about_info_tile_data.dart';

class AboutTabBar extends StatelessWidget {
  const AboutTabBar({super.key});

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
            Text("Certification"),
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

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: KHorizontalContentPadding.copyWith(top: 50, right: 250),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "About Me",
            style: kBoldTextStyle.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 80),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  height: MediaQuery.of(context).size.height * 0.5,
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
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          maxLines: 6,
                        ),
                        const SizedBox(height: 40),
                        const AboutTabBar(),
                        const SizedBox(height: 30),
                        const SizedBox(
                          height: 200,
                          child: TabBarView(
                            children: [
                              SkillsView(),
                              EducationView(),
                              CerificationView(),
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

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kSkillsList.length,
      itemBuilder: (context, index) {
        return AboutInfoTile(
          data: kSkillsList[index],
        );
      },
    );
  }
}

class CerificationView extends StatelessWidget {
  const CerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kCertificationList.length,
      itemBuilder: (context, index) {
        return AboutInfoTile(
          data: kCertificationList[index],
        );
      },
    );
  }
}

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kEducationList.length,
      itemBuilder: (context, index) {
        return AboutInfoTile(
          data: kEducationList[index],
        );
      },
    );
  }
}

class AboutInfoTile extends StatelessWidget {
  final AboutInfoTileData data;

  const AboutInfoTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        subtitle: Text(
          data.tertiaryText == null
              ? data.secondaryText
              : "${data.secondaryText}\n${data.tertiaryText!}",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        isThreeLine: data.tertiaryText != null,
      ),
    );
  }
}
