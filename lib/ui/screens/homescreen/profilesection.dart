import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/textstyles/kTextStyles.dart';

class ProfileImageLayer extends StatelessWidget {
  const ProfileImageLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 150,
      top: 120,
      bottom: 0,
      child: SizedBox(
        child: Image.asset('assets/images/profile-portrait.png'),
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
        padding: KContentPaddingFromLeft,
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              style: kBoldTextStyle,
              children: const <TextSpan>[
                TextSpan(text: 'Hi, I am '),
                TextSpan(text: 'Aditya', style: TextStyle(color: kThemeColor)),
                TextSpan(
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
    );
  }
}
