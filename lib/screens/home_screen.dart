import 'package:flutter/material.dart';
import 'package:contact_form_app/screens/summary_screen.dart';
import 'package:contact_form_app/components/custom_text_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Screen')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // [Name Field]
              CustomTextFormField(
                labelText: 'Name',
                hintText: 'Enter your name',
                controller: _nameController,
                keyboardType: TextInputType.name,
                validator: (value) => _validator(value, 0),
              ),
              const SizedBox(height: 8),

              // [Email Field]
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => _validator(value, 1),
              ),
              const SizedBox(height: 8),

              // [Message Field]
              CustomTextFormField(
                maxLines: 7,
                maxLength: 300,
                hintText: 'Your message',
                controller: _messageController,
                keyboardType: TextInputType.multiline,
                validator: (value) => _validator(value, 2),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _goNext, child: const Text('Next'))
            ],
          ),
        ),
      ),
    );
  }

  void _goNext() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SummaryScreen(name: name, email: email, message: message)));
    }
  }

  String? _validator(String? value, int num) {
    switch (num) {
      case 0: // Name validation
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        } else if (value.length < 3) {
          return 'Name must be at least 3 characters long';
        }
        break;

      case 1: // Email validation
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        break;

      case 2: // Message validation
        if (value == null || value.isEmpty) {
          return 'Please enter a message';
        }
        break;
    }
    return null;
  }
}
