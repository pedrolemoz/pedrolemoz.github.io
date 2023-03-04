import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/assets/assets.dart';
import '../../core/assets/links.dart';
import '../../core/components/labeled_button.dart';
import '../../core/utils/routes.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(),
      body: Center(
        child: Column(
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
        ),
      ),
    );
  }
}

class NavigationMenuDrawer extends StatelessWidget {
  const NavigationMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: Routes.values.length,
        itemBuilder: (context, index) {
          final route = Routes.values[index];
          return RouteTile(route: route);
        },
      ),
    );
  }
}

class RouteTile extends StatelessWidget {
  final Routes route;

  const RouteTile({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(route.title),
      onTap: () {
        final routeName = Modular.to.path;
        if (routeName == route.value) {
          Modular.to.maybePop();
        } else {
          Modular.to.pushReplacementNamed(route.value);
        }
      },
    );
  }
}
