part of 'login_bloc.dart';

enum LoginStatus {
  init,
  loading,
  error,
  success;

  bool get isInit => this == LoginStatus.init;
  bool get isLoading => this == LoginStatus.loading;
  bool get isError => this == LoginStatus.error;
  bool get isSuccess => this == LoginStatus.success;
}

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    required this.userType,
    this.name = '',
    this.email = '',
    this.password = '',
    this.phone = '',
    this.altura,
    this.peso,
    this.cuadro = '',
    this.liga = '',
    this.position = '',
    this.medicalExpiration = '',
    this.medicalFile = '',
    this.previousInjuries = const [],
  });

  const LoginState.initial()
      : this(
          status: LoginStatus.init,
          userType: AppUserType.player,
        );

  final LoginStatus status;
  final AppUserType userType;
  final String name;
  final String email;
  final String password;
  final String phone;
  final double? altura;
  final double? peso;
  final String cuadro;
  final String liga;
  final String position;
  final String medicalExpiration;
  final String medicalFile;
  final List<Injury> previousInjuries;

  @override
  List<Object?> get props => [
        status,
        userType,
        name,
        email,
        password,
        phone,
        altura,
        peso,
        cuadro,
        liga,
        position,
        medicalExpiration,
        medicalFile,
        previousInjuries,
      ];

  LoginState copyWith({
    LoginStatus? status,
    AppUserType? userType,
    String? name,
    String? email,
    String? password,
    String? phone,
    double? altura,
    double? peso,
    String? cuadro,
    String? liga,
    String? position,
    String? medicalExpiration,
    String? medicalFile,
    List<Injury>? previousInjuries,
  }) {
    return LoginState(
      status: status ?? this.status,
      userType: userType ?? this.userType,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
      cuadro: cuadro ?? this.cuadro,
      liga: liga ?? this.liga,
      position: position ?? this.position,
      medicalExpiration: medicalExpiration ?? this.medicalExpiration,
      medicalFile: medicalFile ?? this.medicalFile,
      previousInjuries: previousInjuries ?? this.previousInjuries,
    );
  }
}
