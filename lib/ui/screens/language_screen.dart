import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage = 'English';

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      leading: Radio<String>(value: language),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: RadioGroup<String>(
        groupValue: _selectedLanguage,
        onChanged: (String? value) {
          if (value == null) return;
          setState(() {
            _selectedLanguage = value;
          });
        },
        child: ListView(
          children: [
            _buildLanguageOption('English'),
            _buildLanguageOption('Français'),
            _buildLanguageOption('Español'),
          ],
        ),
      ),
    );
  }
}
