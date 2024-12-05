import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1200),
            height: 48,
            width: isExpanded ? 200 : 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 12),
              color: isExpanded ? Colors.green : Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isExpanded ? Icons.check : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (isExpanded)
                  const Text(
                    "Added to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
