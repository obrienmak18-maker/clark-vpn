import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: ListView(
        children: [
          RadioListTile<String>(
            title: const Text('English'),
            value: 'English',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
              // TODO: Implement language change logic
            },
          ),
          RadioListTile<String>(
            title: const Text('Français'),
            value: 'Français',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
              // TODO: Implement language change logic
            },
          ),
          RadioListTile<String>(
            title: const Text('Español'),
            value: 'Español',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
              // TODO: Implement language change logic
            },
          ),
        ],
      ),
    );
  }
}
