import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final String imageUrl;
  final String breed;
  final String id;
  final VoidCallback? onPressed;

  const LikeButton({
    super.key,
    required this.imageUrl,
    required this.breed,
    required this.id,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.thumb_up),
      label: const Text('Лайк'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () {
        onPressed?.call();
      },
    );
  }
}
