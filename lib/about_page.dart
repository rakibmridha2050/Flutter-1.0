import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About This App")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the Project",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Text(
              "This Flutter project demonstrates how named routing works. "
              "It lets you hop between screens without losing your sense of direction.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            SizedBox(height: 20),

            Text(
              "Why Routing?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Routing helps you organize your app into smaller, navigable pieces. "
              "It's the map of your UI world.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back Home"),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
