import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimationPosition,
  });

  final double slidingAnimationPosition;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 2),
      curve: Curves.easeIn,
      bottom: slidingAnimationPosition,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          'Read And Learn',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}