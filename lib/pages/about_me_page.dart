import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../components/labeled_button.dart';
import '../components/technology_card.dart';
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
      child: Scrollbar(
        controller: pageController,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: [
              _ContactsPage(pageController: pageController),
              _WhoIAmPage(pageController: pageController),
            ],
          ),
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
        Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('me.png'),
              maxRadius: 120,
              minRadius: 50,
            ),
            SizedBox(height: 16),
            Text(
              'Pedro Lemos',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              'Computer Scientist and Software Engineer',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            // SizedBox(height: 16),
          ],
        ),
        SizedBox(height: 16),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabeledButton(text: 'LinkedIn', icon: UniconsLine.linkedin),
                LabeledButton(text: 'GitHub', icon: UniconsLine.github),
                LabeledButton(text: 'Email', icon: UniconsLine.envelope),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabeledButton(
                  text: 'Resume (EN)',
                  icon: UniconsLine.file_download,
                ),
                LabeledButton(
                  text: 'Resume (PT)',
                  icon: UniconsLine.file_download,
                ),
              ],
            ),
          ],
        ),
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
  ].reduce((a, b) => a += ' $b');

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
                'Languages, Frameworks and Technologies',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const TechnologyCard(
                      asset: 'flutter.png',
                      label: 'Flutter',
                    ),
                    const TechnologyCard(
                      asset: 'dart.png',
                      label: 'Dart',
                    ),
                    const TechnologyCard(
                      asset: 'python.png',
                      label: 'Python',
                    ),
                    const TechnologyCard(
                      asset: 'kotlin.png',
                      label: 'Kotlin',
                    ),
                    const TechnologyCard(
                      asset: 'swift.png',
                      label: 'Swift',
                    ),
                    const TechnologyCard(
                      asset: 'c.png',
                      label: 'C',
                    ),
                    const TechnologyCard(
                      asset: 'c_sharp.png',
                      label: 'C#',
                    ),
                    const TechnologyCard(
                      asset: 'java.png',
                      label: 'Java',
                    ),
                    const TechnologyCard(
                      asset: 'javascript.png',
                      label: 'Javascript',
                    ),
                    const TechnologyCard(
                      asset: 'typescript.png',
                      label: 'Typescript',
                    ),
                    const TechnologyCard(
                      asset: 'git.png',
                      label: 'Git',
                    ),
                    const TechnologyCard(
                      asset: 'firebase.png',
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
