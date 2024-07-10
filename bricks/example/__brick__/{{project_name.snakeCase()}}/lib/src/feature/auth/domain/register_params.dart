import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/model/base_user_info.dart';

part 'register_params.mapper.dart';

@MappableClass()
class RegisterParams extends BaseUserInfo with RegisterParamsMappable {
  const RegisterParams({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.subscribeNews,
    @MappableField(key: 'country_id') required this.countryId,
    required this.password,
    @MappableField(key: 'password_confirmation') required this.confirmPassword,
    super.dialCode,
    super.phone,
  });

  final int countryId;
  final String password;
  final String confirmPassword;
}
