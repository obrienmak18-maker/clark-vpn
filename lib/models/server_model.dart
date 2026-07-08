import 'package:flutter/foundation.dart';

enum ServerStatus {
  active,
  inactive,
  maintenance,
}

class Server {
  final String id;
  final String name;
  final String location;
  final String ipAddress;
  final String config;
  final ServerStatus status;
  final int ping;
  final int load;

  Server({
    required this.id,
    required this.name,
    required this.location,
    required this.ipAddress,
    required this.config,
    this.status = ServerStatus.active,
    this.ping = 0,
    this.load = 0,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      id: json['_id'],
      name: json['name'],
      location: json['location'],
      ipAddress: json['ipAddress'],
      config: json['config'],
      status: ServerStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => ServerStatus.active,
      ),
      ping: json['ping'] ?? 0,
      load: json['load'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'location': location,
      'ipAddress': ipAddress,
      'config': config,
      'status': status.toString().split('.').last,
      'ping': ping,
      'load': load,
    };
  }
}
