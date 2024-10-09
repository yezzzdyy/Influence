import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  _CreateOfferScreenState createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Offer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Offer Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Offer Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Save the offer
                      print('Title: ${_titleController.text}');
                      print('Description: ${_descriptionController.text}');
                      Navigator.pop(context);
                    }
                  },
                  child: Text(isIOS ? 'Create Offer' : 'CREATE OFFER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
