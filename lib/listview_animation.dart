import 'package:flutter/material.dart';

class ListviewAnimation extends StatefulWidget {
  const ListviewAnimation({super.key});

  @override
  State<ListviewAnimation> createState() => _ListviewAnimationState();
}

class _ListviewAnimationState extends State<ListviewAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> slideAnimation;
  final int itemCount = 5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimation = List.generate(itemCount, (index) => 
    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve:  Interval(index * 1/ itemCount, 1))
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated ListView"),
      ),
      body: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return SlideTransition(
              position: slideAnimation[index],
              child: ListTile(
                leading: Text(
                  "This is ListTile ${index + 1}",
                  style: textTheme.bodyLarge,
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if(controller.isCompleted){
          controller.reverse();
        }else{
          controller.forward();
        }
      },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
