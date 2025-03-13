import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookHomeCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPlayPressed; // Callback when the button is pressed
  final double height;

  const BookHomeCard({
    super.key,
    required this.imagePath,
    required this.onPlayPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 140, // Ensure it has a fixed width
              height: height, // Ensure it has a fixed height
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          // Play button
          Positioned(
            bottom: 37,
            right: 10,
            child: ClipOval(
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white10.withOpacity(0.6), // Transparent color
                child: IconButton(
                  icon: const Icon(Icons.play_arrow, size: 22, color: Colors.white),
                  onPressed: onPlayPressed, // Calls the function when pressed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
