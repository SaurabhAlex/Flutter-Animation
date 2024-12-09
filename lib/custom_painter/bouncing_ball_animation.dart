import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  //animation controllers
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //initialize animation controllers
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //checking animation status and adding task on that
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    //start animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bouncing Ball Animation"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    size: Size(width / 4, 300),
                    painter: BouncingBallPainter(_animation.value),
                  ),
                  CustomPaint(
                    size: Size(width / 4, 200),
                    painter: BouncingBallPainter(_animation.value),
                  ),
                  CustomPaint(
                    size: Size(width / 4, 300),
                    painter: BouncingBallPainter(_animation.value),
                  ),
                  CustomPaint(
                    size: Size(width / 4, 200),
                    painter: BouncingBallPainter(_animation.value),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animationValue;
  BouncingBallPainter(this.animationValue);

  //creating object using custom painter
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.height / 5, size.height - (size.height * animationValue)),
      20,
      Paint()..color = Colors.blue,
    );
  }

  //checking if value is changing every time then return true that will rebuild when the value will change
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
