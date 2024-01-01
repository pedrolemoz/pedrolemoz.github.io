import 'package:flutter/material.dart';

import '../enums/image_format.dart';
import '../utils/colors.dart';
import '../utils/date_time_extension.dart';

class DataCard extends StatelessWidget {
  final DateTime startDate;
  final DateTime? endDate;
  final String title;
  final String? description;
  final List<Widget>? tags;
  final String logo;
  final ImageFormat imageFormat;

  const DataCard({
    super.key,
    required this.startDate,
    this.endDate,
    required this.title,
    this.description,
    this.tags,
    required this.logo,
    required this.imageFormat,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.4),
              child: Text(
                '${startDate.formattedDate} — ${endDate?.formattedDate ?? 'Present'}'
                    .toUpperCase(),
                style: textTheme.labelMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(logo),
              ),
            ),
          ],
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
              if (description != null) ...[
                const SizedBox(height: 8),
                Text(
                  description!,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ],
              if (tags != null && tags!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  alignment: WrapAlignment.start,
                  children: tags!,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
