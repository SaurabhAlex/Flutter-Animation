import 'package:flutter/material.dart';

import 'flip_widget.dart';

class FlipImageAnimation extends StatefulWidget {
  const FlipImageAnimation({super.key});

  @override
  State<FlipImageAnimation> createState() => _FlipImageAnimationState();
}

class _FlipImageAnimationState extends State<FlipImageAnimation> {
  bool flipped = false;

  @override
  Widget build(BuildContext context) {
    String buttonName = flipped ? "Reverse Flip" : "Forward Flip";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flip Image Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipWidget(
              from: _buildImage("https://picsum.photos/201"),
              to: _buildImage("https://picsum.photos/200"),
              animationStatus:
                  flipped ? AnimationStatus.forward : AnimationStatus.reverse,
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  flipped = !flipped;
                });
              },
              child: Text(buttonName),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(image, height: 200, width: 200, fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // Image is fully loaded, display it
        } else {
          return Center(
            child: CircularProgressIndicator(
              // Show a progress indicator while loading the image
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      }),
    );
  }
}
