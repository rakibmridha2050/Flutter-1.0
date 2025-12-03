// main.dart
// ------------------------------
// This Flutter application demonstrates input widgets, image picking,
// scrolling widgets, and common UI elements.

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyWidget());
}

// Root widget for the app
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputHomePage(), // Loads the input form page
    );
  }
}

// A demo page showing widgets and scrolling examples
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

              // Horizontal scrolling icons
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

              // Input field
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 20),

              // Button showing name using snackbar
              ElevatedButton.icon(
                onPressed: () {
                  final name = nameController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Hello $name")),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text("See the text"),
              ),

              const SizedBox(height: 20),

              // Network image
              Image.network(
                "https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // Repeated Circle Avatar examples
              const Text(
                "circle Avatar image .......",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 2),
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
                  ),
                ),
              ),

              // Asset image
              Image.asset(
                "assets/download.jpg",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // Fade-in network image
              const Text(
                "fade in network image .......",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 2),
              ),
              FadeInImage.assetNetwork(
                placeholder: "assets/images.jpg",
                image: "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
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

// ---------------------------------------------
// Main Input Page Example
// ---------------------------------------------

class InputHomePage extends StatefulWidget {
  const InputHomePage({super.key});

  @override
  State<InputHomePage> createState() => _InputHomePageState();
}

class _InputHomePageState extends State<InputHomePage> {
  // Controllers for form fields
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController multilineCtrl = TextEditingController();

  // Dropdown and toggle states
  String? selectedGender;
  bool agree = false;
  bool notificationOn = false;
  DateTime? selectedDate;

  // Picked image file
  File? pickedImage;

  // Pick image from gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  // Pick image with a dynamic source
  Future<void> pickImageNew(ImageSource sourceParam) async {
    final picker = ImagePicker();
    try {
      final PickedFile = await picker.pickImage(source: sourceParam);
      if (PickedFile != null) {
        setState(() {
          pickedImage = File(PickedFile.path);
        });
      }
    } catch (e) {}
  }

  // Dialog for choosing image source
  void openImageSourceDialog() {
    showDialog(
      context: context,
      builder: (diaglogCtx) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(diaglogCtx, rootNavigator: true).pop();
                  pickImageNew(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(diaglogCtx, rootNavigator: true).pop();
                  pickImageNew(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Shows data through toast
  void _showToast() {
    Fluttertoast.showToast(
      msg:
          "Name: ${nameCtrl.text}\nEmail: ${emailCtrl.text}\nPassword: ${passCtrl.text}\nNumber: ${numberCtrl.text}\nMessage: ${multilineCtrl.text}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Fields Example")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          const Text(
            "Profile Image",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Tap-to-pick image widget
          Center(
            child: GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: pickedImage != null ? FileImage(pickedImage!) : null,
                child: pickedImage == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
              ),
            ),
          ),

          // Buttons for gallery/camera
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 40,
                    onPressed: () => pickImageNew(ImageSource.gallery),
                  ),
                  Text("Gallery"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.camera),
                    iconSize: 40,
                    onPressed: () => pickImageNew(ImageSource.camera),
                  ),
                  Text("Camera"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Open dialog for choosing image source
          ElevatedButton(
            onPressed: openImageSourceDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            ),
            child: const Text("Pick Image"),
          ),

          const SizedBox(height: 20),

          // Name field
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Password field
          TextField(
            controller: passCtrl,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Email field
          TextField(
            controller: emailCtrl,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Number field
          TextField(
            controller: numberCtrl,
            decoration: InputDecoration(
              labelText: "Phone/Number",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Multiline field
          TextField(
            controller: multilineCtrl,
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: "Address / Message",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Dropdown gender selector
          DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(
              labelText: "Gender",
              border: OutlineInputBorder(),
            ),
            items: ["Male", "Female", "Other"]
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: (value) => setState(() => selectedGender = value),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
