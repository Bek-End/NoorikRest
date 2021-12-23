enum VerifyType { sms, email }

class VerifyModel {
  final String phoneNumber;
  final VerifyType verifyType;
  VerifyModel({
    required this.phoneNumber,
    required this.verifyType,
  });
}
