import 'package:flutter/material.dart';
import 'package:clark_vpn/models/server_model.dart';
import 'package:clark_vpn/services/vpn_service.dart';

enum VpnState { disconnected, connecting, connected }

class VpnProvider extends ChangeNotifier {
  final VpnService _vpnService = VpnService();

  VpnState _state = VpnState.disconnected;
  VpnState get state => _state;

  String _currentServerName = 'Auto Selection';
  String get currentServerName => _currentServerName;

  Server? _currentServer;
  Server? get currentServer => _currentServer;

  String _ping = '0 ms';
  String get ping => _ping;

  List<Server> _availableServers = [];
  List<Server> get availableServers => _availableServers;

  Future<void> fetchAvailableServers() async {
    try {
      _availableServers = await _vpnService.getAvailableServers();
      notifyListeners();
    } catch (e) {
      print('Error fetching servers: $e');
    }
  }

  Future<void> toggleConnection() async {
    if (_state == VpnState.disconnected) {
      _state = VpnState.connecting;
      notifyListeners();
      
      if (_currentServer != null) {
        await _vpnService.connectToVpn(_currentServer!);
      } else {
        // Simulate auto-selection if no server is explicitly chosen
        await Future.delayed(const Duration(seconds: 2));
      }
      
      _state = VpnState.connected;
      _ping = '42 ms'; // Placeholder
      notifyListeners();
    } else {
      await _vpnService.disconnectVpn();
      _state = VpnState.disconnected;
      _ping = '0 ms';
      notifyListeners();
    }
  }

  void selectServer(Server server) {
    _currentServer = server;
    _currentServerName = server.name;
    notifyListeners();
  }

  void selectAutoServer() {
    _currentServer = null;
    _currentServerName = 'Auto Selection';
    notifyListeners();
  }
}
