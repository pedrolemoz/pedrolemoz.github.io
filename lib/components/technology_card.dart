import 'package:flutter/material.dart';

class TechnologyCard extends StatelessWidget {
  final String asset;
  final String label;

  const TechnologyCard({super.key, required this.asset, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        child: Container(
          width: 130,
          height: 130,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(asset, scale: 9),
              SizedBox(height: 16),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
