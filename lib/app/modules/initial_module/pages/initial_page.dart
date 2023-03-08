import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/assets/assets.dart';
import '../../../core/assets/links.dart';
import '../../../core/components/labeled_button.dart';
import '../../../core/components/navigation_menu_drawer.dart';
import '../../../core/components/navigation_menu_header.dart';
import '../../../core/components/responsive_layout.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      onDesktop: () {
        return Scaffold(
          body: ListView(
            children: [
              NavigationMenuHeader(),
              Padding(
                padding: const EdgeInsets.only(top: 72),
                child: _InitialPageContent(),
              ),
            ],
          ),
        );
      },
      onMobile: () {
        return Scaffold(
          drawer: NavigationMenuDrawer(),
          appBar: AppBar(),
          body: _InitialPageContent(),
        );
      },
    );
  }
}

class _InitialPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(Assets.me),
          maxRadius: 120,
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
        SizedBox(height: 8),
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
        SizedBox(height: 8),
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
      ],
    );
  }
}
