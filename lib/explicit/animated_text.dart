import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Animated text"),
      ),
      body:  const Center(
        child: AnimatedTitleText(title: "Animated Text",)
      ),
    );
  }
}

class AnimatedTitleText extends StatefulWidget {
  final String title;
  const AnimatedTitleText({super.key, required this.title});

  @override
  State<AnimatedTitleText> createState() => _AnimatedTitleTextState();
}

class _AnimatedTitleTextState extends State<AnimatedTitleText> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late List<Animation<double>> _slideAnimation;
  late List<Animation<double>> _characterAnimation;
  late int titleLength;

  @override
  void initState() {
    super.initState();
    titleLength = widget.title.length;
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _characterAnimation = List.generate(widget.title.length, (index) {
      final begin = index/ titleLength;
      final end = (index + 1)/ titleLength;
      return Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Interval(begin, end, curve: Curves.easeInOut), ),);
    });

    _slideAnimation = List.generate(titleLength, (index) {
      final begin = index/ titleLength;
      final end = (index + 1)/ titleLength;
      return Tween<double>(begin: -20, end: 0).animate(CurvedAnimation(parent: _controller, curve: Interval(begin, end, curve: Curves.easeInOut),),);
    });
    _controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(titleLength, (index) {
        return AnimatedBuilder(animation: _controller, builder: (context, child){
          return Transform.translate(offset: Offset(_slideAnimation[index].value, 0),
          child: Opacity(opacity: _characterAnimation[index].value,
          child: Text(widget.title[index], style: const TextStyle(fontSize: 22),)),
          );
        });
      }) ,
    );
  }
}

