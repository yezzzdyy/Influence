import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class EditInfluencerProfileScreen extends StatefulWidget {
  const EditInfluencerProfileScreen({super.key});

  @override
  _EditInfluencerProfileScreenState createState() =>
      _EditInfluencerProfileScreenState();
}

class _EditInfluencerProfileScreenState
    extends State<EditInfluencerProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _socialMediaController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _socialMediaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: 'Bio'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _socialMediaController,
                decoration:
                    const InputDecoration(labelText: 'Social Media Links'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your social media links';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save the profile
                    print('Name: ${_nameController.text}');
                    print('Bio: ${_bioController.text}');
                    print('Social Media: ${_socialMediaController.text}');
                    Navigator.pop(context);
                  }
                },
                child: Text(isIOS ? 'Save Profile' : 'SAVE PROFILE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
