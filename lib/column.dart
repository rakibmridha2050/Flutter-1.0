import 'package:flutter/material.dart';

void main() {
  runApp(RowEx());
}

class ColumnEx extends StatelessWidget {
  const ColumnEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100.0,
                width: double.infinity,
                color: Colors.blueAccent,
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
               Container(
                height: 300.0,
                width: double.infinity,
                color: Colors.grey,
              ),
               Container(
                height: 300.0,
                width: double.infinity,
                color: Colors.blueGrey,
              ),
              Text("Hello",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),

              Container(
                height: 100.0,
                width: double.infinity,
                color: Colors.brown,
              ),


            ],
          ),
        ),
      ),

    );
  }
}


class RowEx extends StatelessWidget {
  const RowEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,   // ⭐ HORIZONTAL SCROLL
          child: Row(
            children: [
              Container(
                width: 200,
                height: double.infinity,
                color: Colors.blueAccent,
              ),
              Container(
                width: 250,
                color: Colors.redAccent,
              ),
              Container(
                width: 300,
                color: Colors.grey,
              ),
              Container(
                width: 250,
                color: Colors.blueGrey,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 200,
                color: Colors.brown,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
