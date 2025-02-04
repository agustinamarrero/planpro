import 'package:plantelpro/app/bloc/app_bloc.dart';

class Player {
  Player({
    required this.name,
    required this.email,
    required this.height,
    required this.weight,
    required this.typeOfPlayer,
    this.medicalExpiration,
    this.medicalFile,
    this.previousInjuries = const [],
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'] as String,
      email: json['email'] as String,
      height: json['height'] as double,
      weight: json['weight'] as double,
      medicalExpiration: json['medicalExpiration'] as String?,
      medicalFile: json['medicalFile'] as String?,
      previousInjuries: (json['previousInjuries'] as List<dynamic>?)
              ?.map((item) => Injury.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      typeOfPlayer: json['typeOfPlayer'] as TypeOfPlayer,
    );
  }

  factory Player.empty() {
    return Player(
      name: '',
      email: '',
      height: 0,
      weight: 0,
      typeOfPlayer: TypeOfPlayer.defender,
    );
  }

  final String name;
  final String email;
  final double height;
  final double weight;
  final String? medicalExpiration;
  final String? medicalFile;
  final List<Injury> previousInjuries;
  final TypeOfPlayer typeOfPlayer;

  Player copyWith({
    String? name,
    String? email,
    double? height,
    double? weight,
    String? medicalExpiration,
    String? medicalFile,
    List<Injury>? previousInjuries,
    TypeOfPlayer? typeOfPlayer,
  }) {
    return Player(
      name: name ?? this.name,
      email: email ?? this.email,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      medicalExpiration: medicalExpiration ?? this.medicalExpiration,
      medicalFile: medicalFile ?? this.medicalFile,
      previousInjuries: previousInjuries ?? this.previousInjuries,
      typeOfPlayer: typeOfPlayer ?? this.typeOfPlayer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'height': height,
      'weight': weight,
      'medicalExpiration': medicalExpiration,
      'medicalFile': medicalFile,
      'previousInjuries':
          previousInjuries.map((injury) => injury.toJson()).toList(),
      'typeOfPlayer': typeOfPlayer.displayName,
    };
  }
}

class Injury {
  Injury({
    required this.year,
    required this.description,
  });

  factory Injury.fromJson(Map<String, dynamic> json) {
    return Injury(
      year: json['year'] as int,
      description: json['description'] as String,
    );
  }

  final int year;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'description': description,
    };
  }
}
