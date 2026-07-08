import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need Help?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            const Text(
              'If you have any questions or encounter issues, please contact our support team.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email Support'),
              subtitle: const Text('support@clarkvpn.com'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Visit our FAQ'),
              subtitle: const Text('www.clarkvpn.com/faq'),
              onTap: () {
              
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Operating Hours:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text('Monday - Friday, 9 AM - 5 PM (GMT+1)', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
