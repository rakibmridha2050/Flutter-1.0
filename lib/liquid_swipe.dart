import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() {
  runApp(NationalFlag());
}

class PracticeN8 extends StatelessWidget {
  PracticeN8({super.key});

  final page2 = [
    Container(
      color: Colors.amberAccent,
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/download.jpg"),
    ),
    Container(
      color: Colors.amberAccent,
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/download.jpg",fit: BoxFit.cover,),
    ),
    Container(
      color: Colors.amberAccent,
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/images.jpg",fit: BoxFit.cover,),
    ),
    Container(
      color: Colors.amberAccent,
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/download.jpg",fit: BoxFit.cover,),
    ),
    Container(
      color: Colors.amberAccent,
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/images.jpg",fit: BoxFit.cover,),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(body: LiquidSwipe(pages: page2)),
      ),
    );
  }
}



class NationalFlag extends StatelessWidget {
  const NationalFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:  Colors.deepPurple,),
      darkTheme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ArtsOfBDFlag(),
    );
  }
}

class ArtsOfBDFlag extends StatefulWidget {
  const ArtsOfBDFlag({super.key});

  @override
  State<ArtsOfBDFlag> createState() => _ArtsOfBDFlagState();
}

class _ArtsOfBDFlagState extends State<ArtsOfBDFlag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 48, 52),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.green[700],
            border: Border.all(
              color: Colors.black,
              width: 5,
            )
          ),
          child: Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
