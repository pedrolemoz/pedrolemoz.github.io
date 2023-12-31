import 'package:flutter/material.dart';

import '../models/experience_model.dart';
import 'data_card.dart';
import 'tag_chip.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experienceModel;

  const ExperienceCard({super.key, required this.experienceModel});

  @override
  Widget build(BuildContext context) {
    return DataCard(
      startDate: experienceModel.startDate,
      endDate: experienceModel.endDate,
      title: '${experienceModel.role} · ${experienceModel.company}',
      description: experienceModel.description,
      tags: experienceModel.technologies
          .map((tech) => TagChip(label: tech))
          .toList(),
    );
  }
}
