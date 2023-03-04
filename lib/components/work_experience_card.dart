import 'package:flutter/material.dart';

import '../extensions/date_time_extension.dart';
import '../layout/responsive_layout.dart';

class WorkExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  const WorkExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      onDesktop: () {
        return Row(
          children: [
            SizedBox(
              width: 600,
              child: _InnerCard(
                role: role,
                company: company,
                startDate: startDate,
                endDate: endDate,
                description: description,
              ),
            ),
            SizedBox(width: 32),
            _YearCircle(startDate: startDate),
          ],
        );
      },
      onMobile: () {
        return _InnerCard(
          role: role,
          company: company,
          startDate: startDate,
          endDate: endDate,
          description: description,
        );
      },
    );
  }
}

class _YearCircle extends StatelessWidget {
  final DateTime startDate;

  const _YearCircle({required this.startDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF25232a),
        // color: Colors.red,
      ),
      child: Text(
        startDate.year.toString(),
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _InnerCard extends StatelessWidget {
  final String role;
  final String company;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  const _InnerCard({
    required this.role,
    required this.company,
    required this.startDate,
    required this.endDate,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              role,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SelectableText(
              company,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SelectableText(
              '${startDate.monthAsString} ${startDate.year} - ${endDate.monthAsString} ${endDate.year}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 16),
            SelectableText(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}