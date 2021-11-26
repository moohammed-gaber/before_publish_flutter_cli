// To parse this JSON data, do
//
//     final configuration = configurationFromJson(jsonString);

import 'dart:io';

import 'package:meta/meta.dart';
import 'dart:convert';

Configuration configurationFromJson(String str) =>
    Configuration.fromJson(json.decode(str));

String configurationToJson(Configuration data) => json.encode(data.toJson());

class Configuration {
  Configuration({
    required this.name,
    required this.icon,
    required this.splash,
    required this.package,
  });

  factory Configuration.defaultConfig() {
    return Configuration(
        name: 'My Awesome App',
        icon: 'assets/images/logo.png',
        splash: 'assets/images/splash.png',
        package: 'com.simple');
  }

  final String name;
  final String icon;
  final String splash;
  final String package;

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        name: json["name"],
        icon: json["icon"],
        splash: json["splash"],
        package: json["package"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "splash": splash,
        "package": package,
      };
}
