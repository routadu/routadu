import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/ui/screens/homescreen/aboutscreen.dart';
import 'package:portfolio/ui/widgets/appbar_action_button.dart';
import 'profilesection.dart';
import 'projectshowcasesection.dart';

class HomeScreenAppBar extends StatelessWidget {
  final Function(BuildContext) onNavigateToAbout;
  final Function(BuildContext) onNavigateToContact;

  const HomeScreenAppBar({
    super.key,
    required this.onNavigateToAbout,
    required this.onNavigateToContact,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Padding(
        padding: KContentPaddingFromLeft,
        child: Text(
          "Aditya.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xFFEEEEEE),
          ),
        ),
      ),
      actions: [
        AppBarActionButton(
          onPressed: () => onNavigateToAbout(context),
          text: "About",
        ),
        AppBarActionButton(
          onPressed: () => onNavigateToContact(context),
          text: "Contact",
        ),
        const SizedBox(width: 100),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class ScrollableLayer extends StatefulWidget {
  const ScrollableLayer({super.key});

  @override
  State<ScrollableLayer> createState() => _ScrollableLayerState();
}

class _ScrollableLayerState extends State<ScrollableLayer> {
  ScrollController sc = ScrollController();

  void navigateToAbout(BuildContext context) {
    sc.animateTo(
      MediaQuery.of(context).size.height * 1.2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutSine,
    );
  }

  void navigateToContact(BuildContext context) {
    sc.animateTo(
      MediaQuery.of(context).size.height * 1.25 * 2,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutSine,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        controller: sc,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          HomeScreenAppBar(
            onNavigateToAbout: navigateToAbout,
            onNavigateToContact: navigateToContact,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          const SliverToBoxAdapter(child: ProfileTextSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          const SliverToBoxAdapter(child: ProjectShowcaseSection()),
          const SliverToBoxAdapter(child: AboutSection()),
        ],
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
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: const Stack(
          children: [
            ProfileImageLayer(),
            ScrollableLayer(),
          ],
        ),
      ),
    );
  }
}
