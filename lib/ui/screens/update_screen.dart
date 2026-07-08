import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Available'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.system_update_alt, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              const Text(
                'A new version of Clark VPN is available!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please update to the latest version to enjoy new features and improved security.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement update logic (e.g., open app store link)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opening app store for update...')),
                    );
                  },
                  child: const Text('UPDATE NOW'),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Allow user to skip for now
                },
                child: const Text('Skip this version'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
