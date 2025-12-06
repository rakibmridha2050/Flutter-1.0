import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/3777553/pexels-photo-3777553.jpeg",
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Md. Rakib Mridha",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Flutter Developer | UI Explorer | Code Wanderer",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            SizedBox(height: 30),

            ListTile(
              leading: Icon(Icons.email),
              title: Text("rakib.mridha@example.com"),
            ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text("01611053901"),
            ),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Dhaka, Bangladesh"),
            ),
          ],
        ),
      ),
    );
  }
}
