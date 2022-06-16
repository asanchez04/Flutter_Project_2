import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  
  @override
  Home createState() => Home();

}

class Home extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset('assets/animations/nyan-cat.json'),
          ),
          const SizedBox(height: 20),
          const Text(
            "Cat Wash",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
