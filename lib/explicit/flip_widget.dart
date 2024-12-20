import 'dart:math';

import 'package:flutter/material.dart';

class FlipWidget extends StatefulWidget {
  final Widget from;
  final Widget to;
  final AnimationStatus animationStatus;

  const FlipWidget(
      {super.key,
      required this.from,
      required this.to,
      required this.animationStatus});

  @override
  State<FlipWidget> createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    const flipCurve = Cubic(0.455, 0.030, 0.515, 0.955);
    curvedAnimation = CurvedAnimation(parent: _controller, curve: flipCurve);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlipWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animationStatus != widget.animationStatus) {
      switch (widget.animationStatus) {
        case AnimationStatus.forward:
          _controller.reset();
          _controller.forward();
          break;
        case AnimationStatus.reverse:
          _controller.reverse();
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final Widget child = _controller.value <= 0.5 &&
                  widget.animationStatus != AnimationStatus.completed
              ? widget.from
              : widget.to;

          Widget mirror({required Widget child}) => _controller.value <= 0.5
              ? Container(
                  child: child,
                )
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(pi),
                  child: child,
                );

          return slideUpTransition(
              child: alignmentRotateTransition(mirror(child: child)));
        });
  }

  Widget slideUpTransition({required Widget child}) {
    final Tween<Offset> slideUp =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.0));
    return SlideTransition(
      position: slideUp.animate(curvedAnimation),
      child: child,
    );
  }

  Widget alignmentRotateTransition(Widget child) {
    final alignTransition =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter);
    return Transform(
      alignment: alignTransition.animate(curvedAnimation).value,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(_controller.value * pi),
      child: child,
    );
  }
}
