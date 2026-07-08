class Server {
  final String id;
  final String name;
  final String country;
  final String ipAddress;
  final int ping;
  Server({required this.id, required this.name, required this.country, required this.ipAddress, this.ping = 0});
  factory Server.fromJson(Map<String, dynamic> json) => Server(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    country: json['country'] ?? 'Unknown',
    ipAddress: json['ipAddress'] ?? '',
    ping: json['ping'] ?? 0,
  );
}
