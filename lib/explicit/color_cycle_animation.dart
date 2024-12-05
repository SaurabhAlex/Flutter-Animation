import 'package:flutter/material.dart';

class ColorCycleAnimation extends StatefulWidget {
  const ColorCycleAnimation({super.key});

  @override
  State<ColorCycleAnimation> createState() => _ColorCycleAnimationState();
}

class _ColorCycleAnimationState extends State<ColorCycleAnimation>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(seconds: 10);
  late final AnimationController controller;
  late final Animation<Color?> animation;

  static final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  void initState() {
    super.initState();

    final sequenceItems = <TweenSequenceItem<Color?>>[];

    for (var i = 0; i < colors.length; i++) {
      final beginColor = colors[i];
      final endColor = colors[(i + 1) % colors.length];
      final weight = 1 / colors.length;

      sequenceItems.add(
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: beginColor, end: endColor),
          weight: weight,
        ),
      );
    }

    controller = AnimationController(duration: duration, vsync: this);
    animation = TweenSequence<Color?>(sequenceItems).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Sequences'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height/2/2.5,
              width: MediaQuery.of(context).size.width/2/0.8,
              child: MaterialButton(
                color: animation.value,
                onPressed: () async {
                  await controller.forward();
                  controller.reset();
                },
                child: child,
              ),
            );
          },
          child: const Text('Start Animate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        ),
      ),
    );
  }
}