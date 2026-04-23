import 'package:flutter/material.dart';

class MetadataBadge extends StatelessWidget {
  final int userId;
  final int postId;
  const MetadataBadge({super.key, required this.userId, required this.postId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'User $userId',
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Post #$postId',
          style: textTheme.labelLarge?.copyWith(color: colorScheme.outline),
        ),
      ],
    );
  }
}
