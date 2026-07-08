import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/vpn_provider.dart';
import '../../models/server_model.dart';

class ServerListScreen extends StatefulWidget {
  const ServerListScreen({super.key});

  @override
  State<ServerListScreen> createState() => _ServerListScreenState();
}

class _ServerListScreenState extends State<ServerListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VpnProvider>(context, listen: false).fetchAvailableServers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Server'),
      ),
      body: Consumer<VpnProvider>(
        builder: (context, vpnProvider, child) {
          if (vpnProvider.availableServers.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: vpnProvider.availableServers.length + 1, // +1 for Auto Selection
            itemBuilder: (context, index) {
              if (index == 0) {
                // Auto Selection option
                return ListTile(
                  leading: const Icon(Icons.auto_awesome),
                  title: const Text('Auto Selection'),
                  trailing: vpnProvider.currentServer == null
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    vpnProvider.selectAutoServer();
                    Navigator.pop(context);
                  },
                );
              }
              final server = vpnProvider.availableServers[index - 1];
              return ListTile(
                leading: const Icon(Icons.flag),
                title: Text(server.name),
                subtitle: Text('${server.location} - Ping: ${server.ping}ms'),
                trailing: vpnProvider.currentServer?.id == server.id
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  vpnProvider.selectServer(server);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}
