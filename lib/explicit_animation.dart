import 'package:flutter/material.dart';

class ServerDataExplicitAnimation extends StatefulWidget {
  const ServerDataExplicitAnimation({super.key});

  @override
  _ServerDataExplicitAnimationState createState() =>
      _ServerDataExplicitAnimationState();
}

class _ServerDataExplicitAnimationState
    extends State<ServerDataExplicitAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _dataLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);

    // Simulating data fetch from a server
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _dataLoaded = true;
      });
      _controller.forward(); // Start animation when data is loaded
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _dataLoaded ? _animation.value : 100,
              height: 100,
              color: _dataLoaded ? Colors.green : Colors.red,
              alignment: Alignment.center,
              child: Text(
                _dataLoaded ? "Data Loaded!" : "Loading...",
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
