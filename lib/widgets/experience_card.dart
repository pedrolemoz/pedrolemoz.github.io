import 'package:flutter/material.dart';

import '../models/experience_model.dart';
import '../utils/colors.dart';
import '../utils/date_time_extension.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experienceModel;

  const ExperienceCard({super.key, required this.experienceModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.4),
          child: Text(
            '${experienceModel.startDate.formattedDate} — ${experienceModel.endDate?.formattedDate ?? 'Present'}'
                .toUpperCase(),
            style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${experienceModel.role} · ${experienceModel.company}',
                style: textTheme.titleMedium?.copyWith(
                  color: ThemeColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                experienceModel.description,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                alignment: WrapAlignment.start,
                children: experienceModel.technologies
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
