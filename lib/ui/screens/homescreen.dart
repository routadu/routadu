import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/ui/screens/aboutscreen.dart';
import 'package:portfolio/ui/widgets/appbar_action_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'profilesection.dart';
import 'projectshowcasesection.dart';
import 'dart:html' as html;

class HomeScreenDrawer extends StatelessWidget {
  final VoidCallback onNavigateToAbout;
  final VoidCallback onNavigateToContact;
  final VoidCallback onClickResume;

  const HomeScreenDrawer({
    super.key,
    required this.onNavigateToAbout,
    required this.onNavigateToContact,
    required this.onClickResume,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2.5,
      child: ListView(
        children: [
          const SizedBox(height: 100),
          AppBarActionButton(
            onPressed: onNavigateToAbout,
            text: "About",
          ),
          const SizedBox(height: 20),
          AppBarActionButton(
            onPressed: onNavigateToContact,
            text: "Contact",
          ),
          const SizedBox(height: 20),
          AppBarActionButton(
            onPressed: onClickResume,
            text: "Resume",
          ),
        ],
      ),
    );
  }
}

class HomeScreenAppBar extends StatelessWidget {
  final VoidCallback onNavigateToAbout;
  final VoidCallback onNavigateToContact;
  final VoidCallback onClickResume;

  const HomeScreenAppBar({
    super.key,
    required this.onNavigateToAbout,
    required this.onNavigateToContact,
    required this.onClickResume,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: getValueForScreenType(
          context: context,
          mobile: KContentPaddingFromLeftMobile,
          desktop: KContentPaddingFromLeft,
        ),
        child: const Text(
          "Aditya.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xFFEEEEEE),
          ),
        ),
      ),
      actions: getValueForScreenType<List<Widget>>(
        context: context,
        mobile: [
          IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(
                Icons.menu_rounded,
                size: 25,
              )),
          const SizedBox(width: 20),
        ],
        desktop: [
          AppBarActionButton(
            onPressed: onNavigateToAbout,
            text: "About",
          ),
          AppBarActionButton(
            onPressed: onNavigateToContact,
            text: "Contact",
          ),
          AppBarActionButton(
            onPressed: onClickResume,
            text: "Resume",
          ),
          const SizedBox(width: 100),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class ScrollableLayer extends StatelessWidget {
  const ScrollableLayer({
    super.key,
    required this.sc,
    required this.onNavigateToAbout,
    required this.onNavigateToContact,
    required this.onClickResume,
  });

  final ScrollController sc;
  final VoidCallback onNavigateToAbout;
  final VoidCallback onNavigateToContact;
  final VoidCallback onClickResume;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        controller: sc,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          HomeScreenAppBar(
            onNavigateToAbout: onNavigateToAbout,
            onNavigateToContact: onNavigateToContact,
            onClickResume: onClickResume,
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController sc = ScrollController();

  void _showMessage() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        content: Text(
          "❕ This website is currently under development",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text("Okay")),
        ],
      ),
    );
  }

  void showMessage() async {
    await Future.delayed(const Duration(seconds: 3));
    _showMessage();
  }

  @override
  void initState() {
    super.initState();
    showMessage();
  }

  void navigateToContact() {
    final scType = getDeviceType(MediaQuery.of(context).size);
    if (scType == DeviceScreenType.mobile) {
      Navigator.of(context).pop();
    }
    return;
    // sc.animateTo(
    //   MediaQuery.of(context).size.height * 1.2,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.easeInOutSine,
    // );
  }

  void navigateToAbout() {
    final scType = getDeviceType(MediaQuery.of(context).size);
    if (scType == DeviceScreenType.mobile) {
      Navigator.of(context).pop();
    }
    sc.animateTo(
      MediaQuery.of(context).size.height * 1.25 * 2,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutSine,
    );
  }

  void openResume() {
    html.window.open(kResumePublicLink, 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: HomeScreenDrawer(
          onClickResume: openResume,
          onNavigateToAbout: navigateToAbout,
          onNavigateToContact: navigateToContact,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            const ProfileImageLayer(),
            ScrollableLayer(
              sc: sc,
              onClickResume: openResume,
              onNavigateToAbout: navigateToAbout,
              onNavigateToContact: navigateToContact,
            ),
          ],
        ),
      ),
    );
  }
}
