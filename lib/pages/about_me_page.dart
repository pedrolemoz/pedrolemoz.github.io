import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../components/labeled_button.dart';
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
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(height: 16),
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
                SizedBox(height: 32),
                IconButton(
                  splashRadius: 24,
                  onPressed: () {},
                  icon: Icon(UniconsLine.angle_down, size: 24),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
