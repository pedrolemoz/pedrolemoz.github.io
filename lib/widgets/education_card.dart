import 'package:flutter/material.dart';

import '../models/education_model.dart';
import 'data_card.dart';
import 'tag_chip.dart';

class EducationCard extends StatelessWidget {
  final EducationModel educationModel;

  const EducationCard({super.key, required this.educationModel});

  @override
  Widget build(BuildContext context) {
    return DataCard(
      startDate: educationModel.startDate,
      endDate: educationModel.endDate,
      title:
          '${educationModel.degree} in ${educationModel.field} · ${educationModel.institution}',
      description: educationModel.description,
      tags: educationModel.tags.map((tag) => TagChip(label: tag)).toList(),
    );
  }
}
