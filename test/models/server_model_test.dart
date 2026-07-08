import 'package:clark_vpn/models/server_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Server', () {
    test('supports legacy VPN service fields', () {
      final server = Server(
        id: '1',
        name: 'United States - New York',
        country: 'United States',
        ipAddress: '192.168.1.1',
        location: 'New York',
        config: 'wireguard_config_ny',
        load: 20,
        ping: 30,
      );

      expect(server.country, 'United States');
      expect(server.location, 'New York');
      expect(server.config, 'wireguard_config_ny');
      expect(server.load, 20);
      expect(server.ping, 30);
    });
  });
}
