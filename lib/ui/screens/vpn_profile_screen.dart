import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VpnProfileScreen extends StatefulWidget {
  const VpnProfileScreen({super.key});

  @override
  State<VpnProfileScreen> createState() => _VpnProfileScreenState();
}

class _VpnProfileScreenState extends State<VpnProfileScreen> {
  String _vpnConfigText = '';
  String? _selectedFilePath;

  Future<void> _importFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['monvpn', 'conf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _selectedFilePath = file.path;
      });
      try {
        final String configContent = await File(file.path!).readAsString();
        setState(() {
          _vpnConfigText = configContent;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Configuration VPN importée depuis ${file.name}')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de la lecture du fichier: $e')),
        );
      }
    } else {
      // User canceled the picker
    }
  }

  Future<void> _exportToFile() async {
    if (_vpnConfigText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aucune configuration VPN à exporter.')),
      );
      return;
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/my_vpn_profile.monvpn');
      await file.writeAsString(_vpnConfigText);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Configuration VPN exportée vers ${file.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'exportation du fichier: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gérer les profils VPN'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Importer/Exporter la configuration VPN',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: _vpnConfigText),
              onChanged: (value) {
                setState(() {
                  _vpnConfigText = value;
                });
              },
              maxLines: 10,
              decoration: const InputDecoration(
                labelText: 'Configuration VPN (texte)',
                hintText: 'Collez votre configuration WireGuard ou OpenVPN ici',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _importFromFile,
                    icon: const Icon(Icons.file_upload),
                    label: const Text('Importer depuis un fichier'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _exportToFile,
                    icon: const Icon(Icons.file_download),
                    label: const Text('Exporter vers un fichier'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_selectedFilePath != null)
              Text('Fichier sélectionné: $_selectedFilePath'),
            const SizedBox(height: 40),
            Text(
              'Gestion des profils enregistrés (TODO)',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            // TODO: Add UI for managing saved VPN profiles (create, delete, edit, duplicate, favorite)
          ],
        ),
      ),
    );
  }
}
