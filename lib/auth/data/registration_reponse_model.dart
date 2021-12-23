class RegistrationResponseModel {
  final String? clientId;
  final String? name;
  final String? phone;
  final String? email;
  final List<String> authorities;
  RegistrationResponseModel({
    this.clientId,
    this.name,
    this.phone,
    this.email,
    required this.authorities,
  });

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'name': name,
      'phone': phone,
      'email': email,
      'authorities': authorities,
    };
  }

  factory RegistrationResponseModel.fromMap(Map<String, dynamic> map) {
    return RegistrationResponseModel(
      clientId: map['clientId'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      authorities: List<String>.from(map['authorities']),
    );
  }
}
