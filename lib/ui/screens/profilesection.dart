import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileImageLayer extends StatelessWidget {
  const ProfileImageLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right:
          20, //getValueForScreenType(context: context, mobile: 20, desktop: 20),
      top: 120,
      bottom: 0,
      child: SizedBox(
        width: getValueForScreenType(
          context: context,
          mobile: MediaQuery.of(context).size.width * 0.55,
        ),
        child: Image.asset(
          'assets/images/profile-portrait.png',
        ),
      ),
    );
  }
}

class ProfileTextSection extends StatelessWidget {
  const ProfileTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: getValueForScreenType(
          context: context,
          mobile: KContentPaddingFromLeftMobile,
          desktop: KContentPaddingFromLeft,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              style: kBoldTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              children: getValueForScreenType(
                context: context,
                mobile: [
                  const TextSpan(text: 'Hi,\n'),
                  const TextSpan(text: 'I am\n'),
                  const TextSpan(
                      text: 'Aditya', style: TextStyle(color: kThemeColor)),
                  const TextSpan(
                    text: '\n\n\nFlutter & Android\nMobile App Developer',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                    ),
                  ),
                ],
                desktop: [
                  const TextSpan(text: 'Hi, I am '),
                  const TextSpan(
                      text: 'Aditya', style: TextStyle(color: kThemeColor)),
                  const TextSpan(
                    text: '\n\n\nFlutter & Android\nMobile App Developer',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
