import 'package:flutter/material.dart';

class LabeledButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const LabeledButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
