import 'package:flutter/material.dart';

import '../models/person_data_model.dart';
import '../utils/colors.dart';
import '../utils/layout_extension.dart';
import '../widgets/education_card.dart';
import '../widgets/experience_card.dart';

class DataSection extends StatelessWidget {
  final GlobalKey aboutKey;
  final GlobalKey educationKey;
  final GlobalKey experienceKey;
  final PersonDataModel personDataModel;
  final ScrollController scrollController;

  const DataSection({
    super.key,
    required this.aboutKey,
    required this.educationKey,
    required this.experienceKey,
    required this.personDataModel,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    if (size.isDesktop) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About'.toUpperCase(),
              key: aboutKey,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              personDataModel.fullDescription,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),
            Text(
              'Education'.toUpperCase(),
              key: educationKey,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColors.white,
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: personDataModel.education.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              itemBuilder: (context, index) {
                final educationModel =
                    personDataModel.education.elementAt(index);
                return EducationCard(educationModel: educationModel);
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Experiences'.toUpperCase(),
              key: experienceKey,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColors.white,
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: personDataModel.experiences.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              itemBuilder: (context, index) {
                final experienceModel =
                    personDataModel.experiences.elementAt(index);
                return ExperienceCard(experienceModel: experienceModel);
              },
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About'.toUpperCase(),
            key: aboutKey,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ThemeColors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            personDataModel.fullDescription,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 32),
          Text(
            'Education'.toUpperCase(),
            key: educationKey,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ThemeColors.white,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personDataModel.education.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 32,
            ),
            itemBuilder: (context, index) {
              final educationModel = personDataModel.education.elementAt(index);
              return EducationCard(educationModel: educationModel);
            },
          ),
          const SizedBox(height: 32),
          Text(
            'Experiences'.toUpperCase(),
            key: experienceKey,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ThemeColors.white,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personDataModel.experiences.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 32,
            ),
            itemBuilder: (context, index) {
              final experienceModel =
                  personDataModel.experiences.elementAt(index);
              return ExperienceCard(experienceModel: experienceModel);
            },
          ),
        ],
      ),
    );
  }
}
