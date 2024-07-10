import 'package:dart_mappable/dart_mappable.dart';

part 'otp_and_reset_password_params.mapper.dart';

@MappableClass()
class OtpBase with OtpBaseMappable {
  const OtpBase({
    required this.email,
    required this.type,
  });
  final String email;
  final OtpType type;
}

/*================== SendOtpParams =================*/

@MappableClass()
class SendOtpParams extends OtpBase with SendOtpParamsMappable {
  const SendOtpParams({
    required super.email,
    required super.type,
  });
}

@MappableEnum()
enum OtpType {
  @MappableValue('verify_email')
  verifyEmail,
  @MappableValue('reset_password')
  resetPassword,
}

/*================== VerifyOtpParams =================*/

@MappableClass()
class VerifyOtpParams extends OtpBase with VerifyOtpParamsMappable {
  const VerifyOtpParams({
    required this.otp,
    required super.email,
    required super.type,
  });
  final String otp;
}

/*================== ResetPasswordParams =================*/

@MappableClass()
class ResetPasswordParams with ResetPasswordParamsMappable {
  const ResetPasswordParams({
    required this.email,
    required this.otp,
    required this.password,
    @MappableField(key: 'password_confirmation') required this.confirmPassword,
  });
  final String email;
  final String otp;
  final String password;
  final String confirmPassword;
}
