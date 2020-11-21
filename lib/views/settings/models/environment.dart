import 'package:flutter/material.dart';

class EnvironmentModel {
  static List<Environment> environments = [
    Environment(
      1,
      'production',
      'https://atlasltlportal.borusanlojistik.com/AtlasMobile/api',
    ),
    Environment(
      2,
      'uat',
      'https://timportal.borusan.com/AtlasMobileUAT/api',
      // 'https://atlasltluatportal.borusanlojistik.com/api',
    ),
    Environment(
      3,
      'test',
      'https://timportal.borusan.com/AtlasMobile/api',
    )
  ];
}

@immutable
class Environment {
  final int id;
  final String name;
  final String url;

  Environment(this.id, this.name, this.url);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Environment && other.id == id;
}
