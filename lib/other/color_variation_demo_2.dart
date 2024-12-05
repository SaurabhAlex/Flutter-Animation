import 'package:flutter/material.dart';

class ColorVariationsDemo2 extends StatelessWidget {
  const ColorVariationsDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Combination"),
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              shrinkWrap: true,  // Prevent GridView from occupying all screen space
              itemCount: 30, // Number of color boxes
              itemBuilder: (context, index) {
                final color = getColorForIndex(index);
                return ColorContainer(color: color);
              },
            ),
          ),
        ),
      ),
    );
  }

  Color getColorForIndex(int index) {
    // Generate colors based on index
    final r = (index % 5) * 50;
    final g = (index % 6) * 50;
    final b = (index % 7) * 50;
    return Color.fromRGBO(r, g, b, 1.0);
  }
}

class ColorContainer extends StatefulWidget {
  final Color color;

  const ColorContainer({super.key, required this.color});

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.color;
  }

  void changeColor() {
    setState(() {
      // Randomize color when tapped
      currentColor = Color.fromRGBO(
        (currentColor.red + 50) % 256,
        (currentColor.green + 50) % 256,
        (currentColor.blue + 50) % 256,
        1.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeColor,
      child: Container(
        height: 100,
        width: 100,
        color: currentColor,
        alignment: Alignment.center,
        child: Text(
          '(${currentColor.red}, ${currentColor.green}, ${currentColor.blue})',
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
