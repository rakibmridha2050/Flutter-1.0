import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DesignPracOne(),
    );
  }
}

class DesignPracOne extends StatelessWidget {
  const DesignPracOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: Colors.blueAccent, // outer container color
            child: Column(
              children: [
                // Row with two equal expanded colored boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color must be here (or use decoration)
                        color: Colors.amberAccent,
                        height:
                            100, // give some height so it is visible inside the Column
                        child: const Center(child: Text("Box 1", )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          // set color inside BoxDecoration if you use decoration
                          color: Color.fromARGB(255, 82, 80, 74),
                        ),
                        height: 100,
                        child: const Center(
                          child: Text(
                            "Box 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: Colors.blueAccent, // outer container color
            child: Column(
              children: [
                // Row with two equal expanded colored boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color must be here (or use decoration)
                        color: Colors.amberAccent,
                        height:
                            100, // give some height so it is visible inside the Column
                        child: const Center(child: Text("Box 1", )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          // set color inside BoxDecoration if you use decoration
                          color: Color.fromARGB(255, 82, 80, 74),
                        ),
                        height: 100,
                        child: const Center(
                          child: Text(
                            "Box 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: Colors.blueAccent, // outer container color
            child: Column(
              children: [
                // Row with two equal expanded colored boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color must be here (or use decoration)
                        color: Colors.amberAccent,
                        height:
                            100, // give some height so it is visible inside the Column
                        child: const Center(child: Text("Box 1", )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          // set color inside BoxDecoration if you use decoration
                          color: Color.fromARGB(255, 82, 80, 74),
                        ),
                        height: 100,
                        child: const Center(
                          child: Text(
                            "Box 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: Colors.blueAccent, // outer container color
            child: Column(
              children: [
                // Row with two equal expanded colored boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color must be here (or use decoration)
                        color: Colors.amberAccent,
                        height:
                            100, // give some height so it is visible inside the Column
                        child: const Center(child: Text("Box 1", )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          // set color inside BoxDecoration if you use decoration
                          color: Color.fromARGB(255, 82, 80, 74),
                        ),
                        height: 100,
                        child: const Center(
                          child: Text(
                            "Box 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: Colors.blueAccent, // outer container color
            child: Column(
              children: [
                // Row with two equal expanded colored boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color must be here (or use decoration)
                        color: Colors.amberAccent,
                        height:
                            100, // give some height so it is visible inside the Column
                        child: const Center(child: Text("Box 1", )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          // set color inside BoxDecoration if you use decoration
                          color: Color.fromARGB(255, 82, 80, 74),
                        ),
                        height: 100,
                        child: const Center(
                          child: Text(
                            "Box 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: Colors.blueAccent, // outer container color
            child: Column(
              children: [
                // Row with two equal expanded colored boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color must be here (or use decoration)
                        color: Colors.amberAccent,
                        height:
                            100, // give some height so it is visible inside the Column
                        child: const Center(child: Text("Box 1", )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          // set color inside BoxDecoration if you use decoration
                          color: Color.fromARGB(255, 82, 80, 74),
                        ),
                        height: 100,
                        child: const Center(
                          child: Text(
                            "Box 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
