import 'package:clark_vpn/models/server_model.dart';
import 'package:clark_vpn/services/api_service.dart';

class VpnService {
  final ApiService _apiService = ApiService();

  Future<List<Server>> getAvailableServers() async {
    // In a real app, you would fetch servers from your backend
    // For now, return mock data
    await Future.delayed(const Duration(seconds: 1));
    return [
      Server(
        id: '1',
        name: 'United States - New York',
        location: 'New York',
        ipAddress: '192.168.1.1',
        config: 'wireguard_config_ny',
        ping: 30,
        load: 20,
      ),
      Server(
        id: '2',
        name: 'United Kingdom - London',
        location: 'London',
        ipAddress: '192.168.1.2',
        config: 'wireguard_config_uk',
        ping: 50,
        load: 40,
      ),
      Server(
        id: '3',
        name: 'France - Paris',
        location: 'Paris',
        ipAddress: '192.168.1.3',
        config: 'wireguard_config_fr',
        ping: 60,
        load: 30,
      ),
    ];
  }

  // TODO: Implement actual VPN connection logic using platform channels
  Future<void> connectToVpn(Server server) async {
    print('Connecting to VPN: ${server.name}');
    await Future.delayed(const Duration(seconds: 2));
    print('Connected to VPN: ${server.name}');
  }

  Future<void> disconnectVpn() async {
    print('Disconnecting VPN');
    await Future.delayed(const Duration(seconds: 1));
    print('VPN Disconnected');
  }
}
