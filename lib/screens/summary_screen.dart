import 'package:flutter/material.dart';
import 'package:contact_form_app/components/info_display_widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key,
    required this.name,
    required this.email,
    required this.message,
  });

  final String name;
  final String email;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoDisplayWidget(type: 'Name: ', data: name),
              const SizedBox(height: 8),
              InfoDisplayWidget(type: 'Email: ', data: email),
              const SizedBox(height: 8),
              InfoDisplayWidget(type: 'Message: ', data: message),
            ],
          ),
        ),
      ),
    );
  }
}
