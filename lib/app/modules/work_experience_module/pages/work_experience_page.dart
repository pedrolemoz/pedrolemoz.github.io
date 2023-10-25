import 'package:flutter/material.dart';

import '../../../core/components/navigation_menu_drawer.dart';
import '../../../core/components/navigation_menu_header.dart';
import '../../../core/components/responsive_layout.dart';
import '../../../core/extensions/list_extension.dart';
import '../widgets/work_experience_card.dart';

class WorkExperiencePage extends StatelessWidget {
  const WorkExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      onDesktop: () {
        return Scaffold(
          body: ListView(
            children: const [
              NavigationMenuHeader(),
              _MobileDevelopmentExperienceContent(),
            ],
          ),
        );
      },
      onMobile: () {
        return Scaffold(
          drawer: const NavigationMenuDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Work Experience',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: const SingleChildScrollView(
            child: _MobileDevelopmentExperienceContent(),
          ),
        );
      },
    );
  }
}

class _MobileDevelopmentExperienceContent extends StatelessWidget {
  const _MobileDevelopmentExperienceContent();

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
              'Mobile Development',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WorkExperienceCard(
                    role: 'Software Engineer',
                    company: 'FTeam',
                    startDate: DateTime(2023, 4),
                    description: [
                      'At first, was acting as a consultant at Nasajon, helping the development of an app called Gestão de Serviços.',
                      'I guided developers to build this app, by sharing my experience on mobile development and software architecture.',
                      'Then, I was responsible of establishing the architectural specification for an internal project called Ship.',
                      'This architectural specification mostly follows Clean Architecture and SOLID principles, but is focused on reduce boilerplate code.',
                      'Futhermore, I was a Tech Leader in the development of an app called App do Colportor, for IATEC.',
                    ].merge,
                  ),
                  WorkExperienceCard(
                    role: 'Specialist Software Developer',
                    company: 'Compass.uol',
                    startDate: DateTime(2022, 4),
                    endDate: DateTime(2022, 12),
                    description: [
                      "Responsible for maintain and improve Ancar's apps for giant malls in several places in Brazil.",
                      'Working on refactoring the app architecture, following SOLID principles, aiming to keep the project cleaner, decoupled and scalable as possible.',
                      'Futhermore, I was responsible for fixing critical bugs in an internal app for São Salvador Alimentos, and to perform some improvements.',
                    ].merge,
                  ),
                  WorkExperienceCard(
                    role: 'Software Engineer',
                    company: 'Code Tecnologia',
                    startDate: DateTime(2021, 2),
                    endDate: DateTime(2022, 4),
                    description: [
                      'Responsible for creating and maintaining multiple apps in Flutter, ensuring good code and best practices.',
                      'At this company, I established a standard for the apps, creating a modular, scalable and testable architecture.',
                      'With this architecture, we could share some modules across all apps (e.g.: authentication).',
                      'I also created an entire design system to be used everywhere.',
                    ].merge,
                  ),
                  WorkExperienceCard(
                    role: 'Software Engineer',
                    company: 'MusicPlayce',
                    startDate: DateTime(2020, 6),
                    endDate: DateTime(2021, 1),
                    description:
                        'Responsible for maintaining the MusicPlayce app (which uses Flutter), posteriorly starting the refactoring process, in order to implement the best development practices.',
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
