import 'package:flutter/material.dart';

class DislikeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DislikeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.thumb_down),
      label: const Text('Дизлайк'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
    );
  }
}
