import 'package:flutter/material.dart';

class ColorVariationsDemo extends StatelessWidget {
  const ColorVariationsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Color Combination"),
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Fully opaque
              // Container(height: 50, width: 100, color: const Color.fromRGBO(0, 0, 200, 1.0)),
              // Semi-transparent

              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(50, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(100, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(150, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(200, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(250, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(255, 0, 0, 1.0)),


              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 50, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 100, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 150, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 200, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 250, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 255, 0, 1.0)),


              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 50, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 100, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 150, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 200, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 250, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 0, 255, 1.0)),



              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(50, 50, 50, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(100, 100, 100, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(150, 150, 150, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(200, 200, 200, 1.0)),



              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 50, 50, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 100, 100, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 150, 150, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(0, 200, 200, 1.0)),


              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(50, 50, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(100, 100, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(150, 150, 0, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(200, 200, 0, 1.0)),


              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(50, 0, 50, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(100, 0, 100, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(150, 0, 150, 1.0)),
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(200, 0, 200, 1.0)),



              // More red
              Container(margin: const  EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(150, 150, 200, 1.0)),
              // More green
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(100, 200, 200, 1.0)),
              // Less blue
              Container(margin: const EdgeInsets.all(8),height: 50, width: 100, color: const Color.fromRGBO(100, 150, 150, 1.0)),
            ],
          ),
        ),
      ),
    );
  }
}

