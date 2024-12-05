import 'package:flutter/material.dart';

class SpringAnimation extends StatefulWidget {
  const SpringAnimation({super.key});
  @override
  State<SpringAnimation> createState() => _SpringAnimationState();
}

class _SpringAnimationState extends State<SpringAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))
          ..forward();
    _animation = Tween<double>(begin: 100, end: 500).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    startAnimation();
    super.initState();
  }

  void startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spring Animation"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: Center(
        child: AnimatedBuilder(animation: _animation, builder: (context, child){
          return Stack(
            children: [
              Positioned(
                  left: 120,
                  top: _animation.value,
                  child:  ElevatedButton(
                    onPressed: startAnimation,
                    child: const Text("Spring Animation"),
                  ),),
            ],
          );
        },

        )
      ),
    );
  }
}
