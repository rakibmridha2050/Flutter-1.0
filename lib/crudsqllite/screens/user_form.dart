import 'package:flutter/material.dart';
import '../bd/database_helper.dart' show DatabaseHelper;
import '../model/user.dart';


class UserForm extends StatefulWidget {
  final User? user; // nullable, for edit
  const UserForm({super.key, this.user});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final ageCtrl = TextEditingController();

  String gender = 'Male';
  bool isActive = true;
  String dob = '';

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      nameCtrl.text = widget.user!.name;
      emailCtrl.text = widget.user!.email;
      ageCtrl.text = widget.user!.age.toString();
      gender = widget.user!.gender;
      dob = widget.user!.dob;
      isActive = widget.user!.isActive;
    }
  }

  Future<void> saveUser() async {
    if (!_formKey.currentState!.validate()) return;
           
    final user = User(
      id: widget.user?.id,
      name: nameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      age: int.tryParse(ageCtrl.text) ?? 0,
      gender: gender,
      dob: dob,
      isActive: isActive,
    );

    final db = DatabaseHelper();
    if (widget.user == null) {
      await db.insertUser(user);
    } else {
      await db.updateUser(user);
    }

    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Form")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 10),

              // Email
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v!.isEmpty ? 'Invalid Email' : null,
              ),
              const SizedBox(height: 10),

              // Age
              TextFormField(
                controller: ageCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 10),

              // Gender
              DropdownButtonFormField(
                value: gender,
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (v) => setState(() => gender = v!),
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              const SizedBox(height: 10),

              // Date of Birth
              ListTile(
                title: Text(dob.isEmpty ? 'Select DOB' : dob),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: dob.isNotEmpty
                        ? DateTime.parse(dob)
                        : DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() => dob = date.toIso8601String().split('T').first);
                  }
                },
              ),
              const SizedBox(height: 10),

              // Active switch
              SwitchListTile(
                value: isActive,
                title: const Text('Active'),
                onChanged: (v) => setState(() => isActive = v),
              ),
              const SizedBox(height: 20),

              // Save button
              ElevatedButton(
                onPressed: saveUser,
                child: const Text('SAVE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
