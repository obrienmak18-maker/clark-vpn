class Server {
  final String id;
  final String name;
  final String country;
  final String ipAddress;
  final String location;
  final String config;
  final int load;
  final int ping;

  Server({
    required this.id,
    required this.name,
    required this.country,
    required this.ipAddress,
    this.location = '',
    this.config = '',
    this.load = 0,
    this.ping = 0,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    country: json['country'] ?? 'Unknown',
    ipAddress: json['ipAddress'] ?? '',
    location: json['location'] ?? '',
    config: json['config'] ?? '',
    load: json['load'] ?? 0,
    ping: json['ping'] ?? 0,
  );
}
