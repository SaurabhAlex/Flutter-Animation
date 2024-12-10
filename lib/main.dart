import 'dart:math';
import 'package:animation/explicit/scale_animation.dart';
import 'package:animation/explicit/spring_animation.dart';
import 'package:animation/explicit/color_cycle_animation.dart';
import 'package:animation/other/image_zoom_feature.dart';
import 'package:animation/explicit/sliding_number_transition.dart';
import 'package:flutter/material.dart';
import 'custom_painter/bouncing_ball_animation.dart';
import 'explicit/animated_text.dart';
import 'other/app_error_screen.dart';
import 'other/default_color_variation.dart';
import 'explicit/pulsing_color_animation.dart';
import 'explicit/fetch_data_animation.dart';
import 'explicit/flip_image.dart';
import 'implicit/implicit_animation.dart';
import 'explicit/listview_animation.dart';
import 'explicit/loading_indicator_animation.dart';
import 'explicit/login_screen_animation.dart';
import 'other/color_variation_demo_2.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(AppErrorScreen(details));
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedText(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double height = 50;
  late double width = 50;
  late Color color = Colors.red;
  late double radius = 12;
  late BorderRadius borderRadius = BorderRadius.circular(12);
  final random = Random();

  void _changeSize() {
    setState(() {
      height = random.nextInt(400).toDouble();
      width = random.nextInt(400).toDouble();
    });
  }

  void _changeColor() {
    setState(() {
      color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeRadius() {
    setState(() {
      borderRadius = BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlipImageAnimation()));
                },
                icon: const Icon(Icons.change_circle_outlined))
          ],
        ),
        body: Center(
            child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: height,
          width: width,
          decoration: BoxDecoration(borderRadius: borderRadius, color: color),
        )),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  _changeSize();
                },
                icon: const Icon(Icons.height)),
            IconButton(
                onPressed: () {
                  _changeColor();
                },
                icon: const Icon(Icons.color_lens)),
            IconButton(
                onPressed: () {
                  _changeRadius();
                },
                icon: const Icon(Icons.format_shapes_rounded)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ColorCycleAnimation()));
                },
                icon: const Icon(Icons.format_shapes_rounded)),
          ],
        ));
  }
}
