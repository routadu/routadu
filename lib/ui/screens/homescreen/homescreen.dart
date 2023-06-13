import 'package:flutter/material.dart';
import 'package:portfolio/ui/themes/textstyles/kTextStyles.dart';
import 'package:portfolio/ui/widgets/onhoverbutton.dart';

final profileText = RichText(
  text: const TextSpan(
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
    children: <TextSpan>[
      TextSpan(
        text: 'Flutter & Android\nApp Developer\n\n',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 34,
        ),
      ),
      TextSpan(
        text:
            'Hi, I am Aditya, focusing on\nbuilding production grade\napplications',
      ),
    ],
  ),
);

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: kBoldTextStyle),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.greenAccent,
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Aditya Rout", style: kBoldTextStyle),
            ),
            actions: [
              AppBarActionButton(onPressed: () {}, text: "About"),
              AppBarActionButton(onPressed: () {}, text: "Contact"),
              const SizedBox(width: 100),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileText,
                        const SizedBox(height: 50),
                        AnimiatedFilledButton(
                          text: "View Projects",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Image.asset('assets/images/profile-portrait.png'),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
