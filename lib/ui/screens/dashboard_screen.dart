import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/vpn_provider.dart';
import 'server_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clark VPN'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
            },
          ),
        ],
      ),
      body: Consumer<VpnProvider>(
        builder: (context, vpn, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Status: ${vpn.state.name.toUpperCase()}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text('Ping: ${vpn.ping}'),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => vpn.toggleConnection(),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: vpn.state == VpnState.connected 
                          ? Colors.green 
                          : vpn.state == VpnState.connecting 
                              ? Colors.orange 
                              : Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.power_settings_new,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ListTile(
                  leading: const Icon(Icons.public),
                  title: const Text('Current Server'),
                  subtitle: Text(vpn.currentServer),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ServerListScreen()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
