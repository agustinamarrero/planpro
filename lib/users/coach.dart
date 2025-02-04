class Coach {
  Coach({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.cuadro,
    required this.liga,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      cuadro: json['cuadro'] as String? ?? '',
      liga: json['liga'] as String? ?? '',
    );
  }

  factory Coach.empty() {
    return Coach(
      name: '',
      email: '',
      phoneNumber: '',
      cuadro: '',
      liga: '',
    );
  }

  final String name;
  final String email;
  final String phoneNumber;
  final String cuadro;
  final String liga;

  Coach copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? cuadro,
    String? liga,
  }) {
    return Coach(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cuadro: cuadro ?? this.cuadro,
      liga: liga ?? this.liga,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'cuadro': cuadro,
      'liga': liga,
    };
  }

  @override
  String toString() {
    return 'Coach(name: $name, email: $email, phoneNumber: $phoneNumber, cuadro: $cuadro, liga: $liga)';
  }
}
