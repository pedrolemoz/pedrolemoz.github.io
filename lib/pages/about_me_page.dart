import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../assets/assets.dart';
import '../assets/links.dart';
import '../components/labeled_button.dart';
import '../components/technology_card.dart';
import '../extensions/list_extension.dart';
import '../layout/page_skeleton.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageSkeleton(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            _ContactsPage(pageController: pageController),
            _WhoIAmPage(pageController: pageController),
          ],
        ),
      ),
    );
  }
}

class _ContactsPage extends StatelessWidget {
  final PageController pageController;

  const _ContactsPage({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(Assets.me),
          maxRadius: 100,
          minRadius: 50,
        ),
        SizedBox(height: 16),
        Text(
          'Pedro Lemos',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'Software Engineer',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            LabeledButton(
              text: 'LinkedIn',
              icon: UniconsLine.linkedin,
              onTap: () => launchUrl(Links.linkedIn),
            ),
            LabeledButton(
              text: 'GitHub',
              icon: UniconsLine.github,
              onTap: () => launchUrl(Links.gitHub),
            ),
            LabeledButton(
              text: 'Email',
              icon: UniconsLine.envelope,
              onTap: () => launchUrl(Links.email),
            ),
          ],
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            LabeledButton(
              text: 'Resume (EN)',
              icon: UniconsLine.file_download,
              onTap: () => launchUrl(Assets.resumeEnglish),
            ),
            LabeledButton(
              text: 'Resume (PT)',
              icon: UniconsLine.file_download,
              onTap: () => launchUrl(Assets.resumePortuguese),
            ),
          ],
        ),
        SizedBox(height: 32),
        IconButton(
          splashRadius: 24,
          onPressed: () => pageController.nextPage(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          ),
          icon: Icon(UniconsLine.angle_down, size: 24),
        ),
      ],
    );
  }
}

class _WhoIAmPage extends StatelessWidget {
  final PageController pageController;

  const _WhoIAmPage({required this.pageController});

  static final _phrases = [
    'I\'m a Software Engineer passionate for programming, writing code since 2018.',
    'Finishing the Bachelor of Science in Computer Science at IFCE.',
    'I am an enthusiast of Software Architecture and new technologies.',
    'I like to develop large and complex applications, and always give the user the best experience possible.',
    'I work better in high collaborative teams, where I can learn and share my experience with others.',
    'Focused primarily in mobile development, but I have interest in back-end technologies too.',
  ].merge;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: 24,
            onPressed: () => pageController.previousPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            ),
            icon: Icon(UniconsLine.angle_up, size: 24),
          ),
          SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Who I Am?',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: SelectableText(
                  _phrases,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Technologies',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    const TechnologyCard(
                      asset: Assets.flutter,
                      label: 'Flutter',
                    ),
                    const TechnologyCard(
                      asset: Assets.dart,
                      label: 'Dart',
                    ),
                    const TechnologyCard(
                      asset: Assets.python,
                      label: 'Python',
                    ),
                    const TechnologyCard(
                      asset: Assets.kotlin,
                      label: 'Kotlin',
                    ),
                    const TechnologyCard(
                      asset: Assets.swift,
                      label: 'Swift',
                    ),
                    const TechnologyCard(
                      asset: Assets.c,
                      label: 'C',
                    ),
                    const TechnologyCard(
                      asset: Assets.cSharp,
                      label: 'C#',
                    ),
                    const TechnologyCard(
                      asset: Assets.java,
                      label: 'Java',
                    ),
                    const TechnologyCard(
                      asset: Assets.javascript,
                      label: 'Javascript',
                    ),
                    const TechnologyCard(
                      asset: Assets.typescript,
                      label: 'Typescript',
                    ),
                    const TechnologyCard(
                      asset: Assets.git,
                      label: 'Git',
                    ),
                    const TechnologyCard(
                      asset: Assets.firebase,
                      label: 'Firebase',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
