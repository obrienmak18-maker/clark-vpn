import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Clark VPN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Version: 1.0.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            const Text(
              'Clark VPN is a secure and fast VPN service designed to protect your online privacy and freedom.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Key Features:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            _buildFeatureItem('High-speed servers worldwide'),
            _buildFeatureItem('Strong encryption for data security'),
            _buildFeatureItem('No-log policy for ultimate privacy'),
            _buildFeatureItem('Easy to use interface'),
            const SizedBox(height: 20),
            Text(
              'Terms of Service',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Read our Terms of Service'),
              onTap: () {
                // TODO: Open Terms of Service in browser
              },
            ),
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Read our Privacy Policy'),
              onTap: () {
                // TODO: Open Privacy Policy in browser
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
