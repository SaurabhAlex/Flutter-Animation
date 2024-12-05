import 'package:flutter/material.dart';

class AppErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const AppErrorScreen(this.errorDetails, {super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Error Widget",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 32, color: Color.fromRGBO(255,0,0,1),),
                const SizedBox(height: 8,),
                Text("Error Occurred!", style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8,),
                Text(errorDetails.exceptionAsString(), textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class ErrorExample extends StatelessWidget{
  const ErrorExample({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Example"),
      ),
      body: Center(
        child:
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
          decoration: BoxDecoration(
            color: const  Color.fromRGBO(200, 100, 250, 1),
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
