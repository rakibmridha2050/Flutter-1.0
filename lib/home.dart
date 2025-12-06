import 'package:app_flutter/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  void handleMessage(String msg) {
    debugPrint("Callback received: $msg");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to the Flutter Routing Demo!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),

            Text("Choose a page to explore:", style: TextStyle(fontSize: 18)),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text("Go to About Page"),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text("Go to Profile Page"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text("Go back to Home"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomCard(
                      title: "Hello Page",
                      subtitle: "Opened via MaterialPageRoute",
                      count: 10,
                      onTapmessage: handleMessage,
                    ),
                  ),
                );
              },
              child: const Text("Open CustomCard Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int count;
  final Function(String)? onTapmessage;

  const CustomCard({
    super.key,
    required this.title,
    this.subtitle,
    this.count = 0,
    this.onTapmessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 22)),

            if (subtitle != null) ...[
              const SizedBox(height: 10),
              Text(subtitle!, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              Text("count: $count"),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  if (onTapmessage != null) {
                    onTapmessage!("Button clicked!");
                  }
                },
                child: const Text("Tap Me"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
