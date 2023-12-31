import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/date_time_extension.dart';

class DataCard extends StatelessWidget {
  final DateTime startDate;
  final DateTime? endDate;
  final String title;
  final String description;
  final List<Widget> tags;

  const DataCard({
    super.key,
    required this.startDate,
    this.endDate,
    required this.title,
    required this.description,
    required this.tags,
  });

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
            '${startDate.formattedDate} — ${endDate?.formattedDate ?? 'Present'}'
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
                title,
                style: textTheme.titleMedium?.copyWith(
                  color: ThemeColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                alignment: WrapAlignment.start,
                children: tags,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
