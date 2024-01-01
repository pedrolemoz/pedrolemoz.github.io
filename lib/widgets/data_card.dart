import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums/image_format.dart';
import '../utils/colors.dart';
import '../utils/date_time_extension.dart';
import '../utils/layout_extension.dart';

class DataCard extends StatelessWidget {
  final DateTime startDate;
  final DateTime? endDate;
  final String title;
  final String? description;
  final List<Widget>? tags;
  final String url;
  final String logo;
  final ImageFormat imageFormat;

  const DataCard({
    super.key,
    required this.startDate,
    this.endDate,
    required this.title,
    this.description,
    this.tags,
    required this.url,
    required this.logo,
    required this.imageFormat,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    if (size.isDesktop) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(logo),
                ),
              ),
              const SizedBox(width: 24),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        color: ThemeColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${startDate.formattedDate} — ${endDate?.formattedDate ?? 'Present'}'
                          .toUpperCase(),
                      style: textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.w200),
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
          ),
        ),
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 80),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(logo),
                  ),
                ),
                const SizedBox(width: 24),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleMedium?.copyWith(
                          color: ThemeColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${startDate.formattedDate} — ${endDate?.formattedDate ?? 'Present'}'
                            .toUpperCase(),
                        style: textTheme.labelMedium
                            ?.copyWith(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (description != null) ...[
              const SizedBox(height: 16),
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
    );
  }
}
