import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';
import 'package:portfolio/ui/widgets/about_info_tile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutTabBar extends StatelessWidget {
  const AboutTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      tabs: const [
        Text("Skills"),
        Text("Education"),
        Text("Certification"),
        Text("Contact"),
      ],
      labelPadding: EdgeInsets.only(
        left: 0,
        right: getValueForScreenType(
          context: context,
          mobile: 30,
          desktop: 60,
        ),
      ),
      indicatorPadding: const EdgeInsets.only(top: 10, right: 20),
      dividerColor: Colors.transparent,
      indicatorWeight: 2,
      labelStyle: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.w900),
      labelColor: Colors.grey.shade400,
      unselectedLabelColor: Colors.grey.shade400,
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: getValueForScreenType(
        context: context,
        mobile: KContentPaddingFromLeftMobile.copyWith(
          right: kContentPaddingFromLeftMobileDouble,
          top: 50,
        ),
        desktop: kHorizontalContentPadding.copyWith(top: 50, right: 250),
      ),
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
          SizedBox(
              height: getValueForScreenType(
                  context: context, mobile: 40, desktop: 80)),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                getValueForScreenType(
                  context: context,
                  mobile: 0.75,
                  desktop: 0.65,
                ),
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.isDesktop) {
                  return const Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutScreenProfilePicture(),
                      SizedBox(width: 50),
                      Expanded(child: AboutScreenDetailsTabView()),
                    ],
                  );
                } else {
                  return const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutScreenDetailsTabView(),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AboutScreenProfilePicture extends StatelessWidget {
  const AboutScreenProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.asset('assets/images/profile-portrait.png'),
    );
  }
}

class AboutScreenDetailsTabView extends StatelessWidget {
  const AboutScreenDetailsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kAboutMeString,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          maxLines: 6,
        ),
        const SizedBox(height: 40),
        const AboutTabBar(),
        const SizedBox(height: 30),
        SizedBox(
          height: getValueForScreenType(
            context: context,
            mobile: 300,
            desktop: 200,
          ),
          child: const TabBarView(
            children: [
              SkillsView(),
              EducationView(),
              CerificationView(),
              ContactView(),
            ],
          ),
        ),
      ],
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

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kContactList.length,
      itemBuilder: (context, index) {
        return AboutInfoTile(
          data: kContactList[index],
        );
      },
    );
  }
}
