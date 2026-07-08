import 'package:flutter/material.dart';
import '../models/server_model.dart';
enum VpnState { disconnected, connecting, connected }
class VpnProvider extends ChangeNotifier {
  VpnState _state = VpnState.disconnected;
  Server? _currentServer;
  List<Server> _availableServers = [Server(id: '1', name: 'Paris', country: 'France', ipAddress: '1.1.1.1', ping: 25)];
  VpnState get state => _state;
  Server? get currentServer => _currentServer;
  List<Server> get availableServers => _availableServers;
  String get currentServerName => _currentServer?.name ?? 'Auto';
  String get ping => '${_currentServer?.ping ?? 0} ms';
  void fetchAvailableServers() {}
  void toggleConnection() { _state = (_state == VpnState.connected) ? VpnState.disconnected : VpnState.connected; notifyListeners(); }
  void selectServer(Server s) { _currentServer = s; notifyListeners(); }
  void selectAutoServer() { _currentServer = null; notifyListeners(); }
}
