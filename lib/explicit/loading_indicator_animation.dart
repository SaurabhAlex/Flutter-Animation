import 'package:flutter/material.dart';

class LoadingIndicatorAnimation extends StatefulWidget {
  const LoadingIndicatorAnimation({super.key});

  @override
  State<LoadingIndicatorAnimation> createState() =>
      _LoadingIndicatorAnimationState();
}

class _LoadingIndicatorAnimationState extends State<LoadingIndicatorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _loadingAnimation;
  final loadingValue = 1.0;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    _loadingAnimation =
        Tween<double>(begin: 0.0, end: loadingValue).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Indicator Animation"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _loadingAnimation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: _loadingAnimation.value,
                    strokeWidth: 10,
                    color: Colors.blue,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text(
                  "${(_loadingAnimation.value * 100).toStringAsFixed(1)}%",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_controller.isCompleted){
            _controller.reverse();
          }else{
            _controller.forward();
          }
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
