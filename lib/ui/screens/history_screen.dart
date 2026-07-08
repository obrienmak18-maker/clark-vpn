import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connection History'),
      ),
      body: ListView.builder(
        itemCount: 5, // Placeholder for demo
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Server: United States - New York',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text('Connected: 2023-10-26 10:30 AM'),
                  Text('Duration: 1h 15m'),
                  Text('Data Used: 150 MB'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
