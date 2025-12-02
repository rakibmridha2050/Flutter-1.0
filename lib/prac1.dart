import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InputHomePage());
  }
}

class DemoPage extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo page"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "This is a Text demo...",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Horizontal scroll demo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple, width: 1),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      12,
                      (index) => Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: [
                              Colors.redAccent,
                              const Color.fromARGB(255, 49, 13, 177),
                              const Color.fromARGB(255, 22, 7, 11),
                            ][index % 3],
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  final name = nameController.text;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Hello $name")));
                },
                icon: const Icon(Icons.check),
                label: const Text("See the text"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Image.network(
                "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                "circle Avatar image .......",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
                  ),
                ),
              ),
              Text(
                "circle Avatar image .......",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
                  ),
                ),
              ),
              Text(
                "circle Avatar image .......",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
                  ),
                ),
              ),

              Image.asset(
                "assets/download.jpg",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Text(
                "fade in network  image .......",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              SizedBox(height: 10),
              FadeInImage.assetNetwork(
                placeholder: "assets/images.jpg",
                image:
                    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
                height: 150,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class InputHomePage extends StatefulWidget {
  const InputHomePage({super.key});

  @override
  State<InputHomePage> createState() => _InputHomePageState();
}

class _InputHomePageState extends State<InputHomePage> {


  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController multilineCtrl = TextEditingController();


  String? selectedGender;
  bool agree = false;
  bool notificationOn = false;
  DateTime? selectedDate;

  // File? pickedImage;


  void _showToast(){
   Fluttertoast.showToast(msg: "Name: ${nameCtrl.text}\nEmail: ${emailCtrl.text}\nPassword: ${passCtrl.text}\nNumber: ${nameCtrl.text}\nMultiLine: ${multilineCtrl.text}",
   toastLength: Toast.LENGTH_LONG,
   gravity: ToastGravity.CENTER,
   );
   
    
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Fields Example"),),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Profile Image", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          TextField(controller: nameCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(),
          ),
          ),
          SizedBox(height: 20,),
          TextField(controller: passCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(),
          ),
          ),
            SizedBox(height: 20,),
           TextField(controller: emailCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
          ),
          ),
            SizedBox(height: 20,),
           TextField(controller: nameCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Phone/Number",
            border: OutlineInputBorder(),
          ),
          ),
          SizedBox(height: 20,),
           TextField(controller: nameCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Address/ Message",
            border: OutlineInputBorder(),
          ),
          ),
          SizedBox(height: 20,),


          DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(
              labelText: "Gender",
              border: OutlineInputBorder(),

            ),
            items: [
              "Male",
              "Female",
              "Other",
            ].map((g) => DropdownMenuItem(value: g,child: Text(g))).toList(),

            onChanged: (value){
              setState(() {
                selectedGender = value;
              });
            },
          ),
          SizedBox(height: 20,),


        ],
      ),
    );
  }
}
