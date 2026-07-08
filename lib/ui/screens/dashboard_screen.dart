import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/vpn_provider.dart';
import 'server_list_screen.dart';
import 'settings_screen.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final vpn = Provider.of<VpnProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Clark VPN'), actions: [IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen())))]),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Status: ${vpn.state.name.toUpperCase()}'),
        SizedBox(height: 50),
        ElevatedButton(onPressed: vpn.toggleConnection, child: Text(vpn.state == VpnState.connected ? 'DISCONNECT' : 'CONNECT')),
        ListTile(title: Text('Server: ${vpn.currentServerName}'), trailing: Icon(Icons.arrow_forward), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServerListScreen())))
      ])),
    );
  }
}
