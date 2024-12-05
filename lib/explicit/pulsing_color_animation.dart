import 'package:flutter/material.dart';

class PulsingColorAnimation extends StatefulWidget{
  const PulsingColorAnimation({super.key});
  @override
  State<PulsingColorAnimation> createState() => _PulsingColorAnimationState();
}



class _PulsingColorAnimationState extends State<PulsingColorAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

 @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.2, end: 0.5).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.green).animate(_controller);
    super.initState();
  }


  @override
  void dispose() {
   _controller.dispose();
   super.dispose();
  }



  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Transition"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: AnimatedBuilder(animation: _controller, builder: (context, child){
        return Center(
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              color: _colorAnimation.value ?? Colors.black,
            ),
          ),
        );
      }),
    );
  }

}