import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/vpn_provider.dart';
class ServerListScreen extends StatelessWidget {
  const ServerListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final vpn = Provider.of<VpnProvider>(context);
    return Scaffold(appBar: AppBar(title: Text('Servers')), body: ListView.builder(itemCount: vpn.availableServers.length, itemBuilder: (c, i) => ListTile(title: Text(vpn.availableServers[i].name), onTap: () { vpn.selectServer(vpn.availableServers[i]); Navigator.pop(context); })));
  }
}
