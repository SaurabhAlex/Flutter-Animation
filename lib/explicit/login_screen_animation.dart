import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    slideAnimation =
        Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero)
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    scaleAnimation = Tween<double>(begin: 0.4, end: 1).animate(controller);
    controller.forward();
    // logoFadeAnimation.addListener(() {
    //   if (logoFadeAnimation.isCompleted) {
    //     controller.reverse();
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen Animation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
                opacity: logoFadeAnimation,
                child: const FlutterLogo(
                  size: 100,
                )),
            const SizedBox(
              height: 15,
            ),
            SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    const TextField(
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        child: const Text("Login"), onPressed: () {}),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
