import 'package:flutter/foundation.dart';

class VpnProfile {
  final String id;
  final String name;
  final String config;
  final bool isFavorite;

  VpnProfile({
    required this.id,
    required this.name,
    required this.config,
    this.isFavorite = false,
  });

  factory VpnProfile.fromJson(Map<String, dynamic> json) {
    return VpnProfile(
      id: json["_id"],
      name: json["name"],
      config: json["config"],
      isFavorite: json["isFavorite"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "config": config,
      "isFavorite": isFavorite,
    };
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final List<VpnProfile> vpnProfiles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.vpnProfiles = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var vpnProfilesJson = json["vpnProfiles"] as List;
    List<VpnProfile> vpnProfilesList = vpnProfilesJson.map((i) => VpnProfile.fromJson(i)).toList();

    return User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      role: json["role"],
      vpnProfiles: vpnProfilesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "role": role,
      "vpnProfiles": vpnProfiles.map((profile) => profile.toJson()).toList(),
    };
  }
}
