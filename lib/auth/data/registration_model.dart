class RegistrationModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? phoneVerificationToken;
  final String? password;
  RegistrationModel({
    this.name,
    this.email,
    this.phone,
    this.phoneVerificationToken,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'phoneVerificationToken': phoneVerificationToken,
      'password': password,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      phoneVerificationToken: map['phoneVerificationToken'],
      password: map['password'],
    );
  }
}
