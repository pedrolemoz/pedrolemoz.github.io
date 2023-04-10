import 'package:flutter/material.dart';

import '../../../core/extensions/date_time_extension.dart';

class WorkExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;

  const WorkExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.startDate,
    this.endDate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              role,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              company,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${startDate.monthAsString} ${startDate.year} - ${endDate == null ? 'Present' : '${endDate!.monthAsString} ${endDate!.year}'}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
