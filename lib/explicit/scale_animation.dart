import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget{
  const ScaleAnimation({super.key});
  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.2).animate(_controller);
    super.initState();
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Logo"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}