import 'package:flutter/material.dart';

import '../../../core/assets/assets.dart';
import '../../../core/components/navigation_menu_drawer.dart';
import '../../../core/components/navigation_menu_header.dart';
import '../../../core/components/responsive_layout.dart';
import '../../../core/extensions/list_extension.dart';
import '../widgets/technology_card.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      onDesktop: () {
        return Scaffold(
          body: ListView(
            children: const [
              NavigationMenuHeader(),
              _AboutMeContent(),
            ],
          ),
        );
      },
      onMobile: () {
        return Scaffold(
          drawer: const NavigationMenuDrawer(),
          appBar: AppBar(
            title: Text(
              'About me',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: const SingleChildScrollView(child: _AboutMeContent()),
        );
      },
    );
  }
}

class _AboutMeContent extends StatelessWidget {
  static final _phrases = [
    "I'm a Software Engineer passionate for programming, writing code since 2018.",
    'Finishing the Bachelor of Science in Computer Science at IFCE.',
    'I am an enthusiast of Software Architecture and new technologies.',
    'I like to develop large and complex applications, and always give the user the best experience possible.',
    'I work better in high collaborative teams, where I can learn and share my experience with others.',
    'Focused primarily in mobile development, but I have interest in back-end technologies too.',
  ].merge;

  const _AboutMeContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Who I Am?',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 600,
              child: Text(
                _phrases,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Technologies',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            const SizedBox(
              width: 600,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  TechnologyCard(
                    asset: Assets.flutter,
                    label: 'Flutter',
                  ),
                  TechnologyCard(
                    asset: Assets.dart,
                    label: 'Dart',
                  ),
                  TechnologyCard(
                    asset: Assets.python,
                    label: 'Python',
                  ),
                  TechnologyCard(
                    asset: Assets.kotlin,
                    label: 'Kotlin',
                  ),
                  TechnologyCard(
                    asset: Assets.swift,
                    label: 'Swift',
                  ),
                  TechnologyCard(
                    asset: Assets.c,
                    label: 'C',
                  ),
                  TechnologyCard(
                    asset: Assets.cSharp,
                    label: 'C#',
                  ),
                  TechnologyCard(
                    asset: Assets.java,
                    label: 'Java',
                  ),
                  TechnologyCard(
                    asset: Assets.javascript,
                    label: 'Javascript',
                  ),
                  TechnologyCard(
                    asset: Assets.typescript,
                    label: 'Typescript',
                  ),
                  TechnologyCard(
                    asset: Assets.git,
                    label: 'Git',
                  ),
                  TechnologyCard(
                    asset: Assets.firebase,
                    label: 'Firebase',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
