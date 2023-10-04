import 'package:flutter/material.dart';

class TechnologyCard extends StatelessWidget {
  final String asset;
  final String label;

  const TechnologyCard({super.key, required this.asset, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(4),
      child: SizedBox(
        width: 135,
        height: 135,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(asset, scale: 9),
            const SizedBox(height: 16),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
