import 'package:flutter/material.dart';

class _PlaceholderDigit extends StatelessWidget {
  const _PlaceholderDigit();

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
    Theme.of(context).textTheme.displayLarge!.copyWith(
      fontWeight: FontWeight.w500,
    );

    final Iterable<Widget> placeholderDigits =
    <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map<Widget>(
          (int n) {
        return Text('$n', style: textStyle);
      },
    );

    return Opacity(
      opacity: 0,
      child: Stack(children: placeholderDigits.toList()),
    );
  }
}

class AnimatedDigit extends StatefulWidget {
  const AnimatedDigit({super.key, required this.value});

  final int value;

  @override
  State<AnimatedDigit> createState() => _AnimatedDigitState();
}

class _AnimatedDigitState extends State<AnimatedDigit>
    with SingleTickerProviderStateMixin {
  static const Duration defaultDuration = Duration(milliseconds: 300);

  late final AnimationController controller;
  late int incomingValue;
  late int outgoingValue;
  List<int> pendingValues =
  <int>[];
  Duration duration = defaultDuration;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: duration,
      vsync: this,
    );
    controller.addStatusListener(handleAnimationCompleted);
    incomingValue = widget.value;
    outgoingValue = widget.value;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleAnimationCompleted(AnimationStatus status) {
    if (status.isCompleted) {
      if (pendingValues.isNotEmpty) {
        controller.duration = duration;
        animateValueUpdate(incomingValue, pendingValues.removeAt(0));
      } else {
        controller.duration = defaultDuration;
      }
    }
  }

  void animateValueUpdate(int outgoing, int incoming) {
    setState(() {
      outgoingValue = outgoing;
      incomingValue = incoming;
      controller.forward(from: 0);
    });
  }

  @override
  void didUpdateWidget(AnimatedDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (controller.isAnimating) {
        pendingValues.add(widget.value);
        final double percentRemaining = 1 - controller.value;
        duration =
            defaultDuration * (1 / (percentRemaining + pendingValues.length));
        controller.animateTo(1.0, duration: duration * percentRemaining);
      } else {
        animateValueUpdate(incomingValue, widget.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.displayLarge!;
    return ClipRect(
      child: Stack(
        children: <Widget>[
          const _PlaceholderDigit(),
          SlideTransition(
            position: controller.drive(
              Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(0, -1),
              ),
            ),
            child: Text(
              key: ValueKey<int>(outgoingValue),
              '$outgoingValue',
              style: textStyle,
            ),
          ),
          SlideTransition(
            position: controller.drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ),
            ),
            child: Text(
              key: ValueKey<int>(incomingValue),
              '$incomingValue',
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}


class SlidingNumberTransition extends StatefulWidget {
  const SlidingNumberTransition({super.key});

  @override
  State<SlidingNumberTransition> createState() => _SlidingNumberTransitionState();
}

class _SlidingNumberTransitionState extends State<SlidingNumberTransition> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDigit(value: value % 10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
