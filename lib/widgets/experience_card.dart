import 'package:flutter/material.dart';

import '../models/experience_model.dart';
import '../utils/colors.dart';
import 'data_card.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experienceModel;

  const ExperienceCard({super.key, required this.experienceModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DataCard(
      startDate: experienceModel.startDate,
      endDate: experienceModel.endDate,
      title: '${experienceModel.role} · ${experienceModel.company}',
      description: experienceModel.description,
      tags: experienceModel.technologies
          .map(
            (tech) => Container(
              decoration: BoxDecoration(
                color: ThemeColors.darkViolet,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  tech,
                  style: textTheme.labelMedium?.copyWith(
                    color: ThemeColors.lightViolet,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
