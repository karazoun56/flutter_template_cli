// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_params.dart';

class RegisterParamsMapper extends ClassMapperBase<RegisterParams> {
  RegisterParamsMapper._();

  static RegisterParamsMapper? _instance;
  static RegisterParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterParamsMapper._());
      BaseUserInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterParams';

  static String _$firstName(RegisterParams v) => v.firstName;
  static const Field<RegisterParams, String> _f$firstName =
      Field('firstName', _$firstName, key: 'first_name');
  static String _$lastName(RegisterParams v) => v.lastName;
  static const Field<RegisterParams, String> _f$lastName =
      Field('lastName', _$lastName, key: 'last_name');
  static String _$email(RegisterParams v) => v.email;
  static const Field<RegisterParams, String> _f$email = Field('email', _$email);
  static bool _$subscribeNews(RegisterParams v) => v.subscribeNews;
  static const Field<RegisterParams, bool> _f$subscribeNews =
      Field('subscribeNews', _$subscribeNews, key: 'subscribe_news');
  static int _$countryId(RegisterParams v) => v.countryId;
  static const Field<RegisterParams, int> _f$countryId =
      Field('countryId', _$countryId, key: 'country_id');
  static String _$password(RegisterParams v) => v.password;
  static const Field<RegisterParams, String> _f$password =
      Field('password', _$password);
  static String _$confirmPassword(RegisterParams v) => v.confirmPassword;
  static const Field<RegisterParams, String> _f$confirmPassword =
      Field('confirmPassword', _$confirmPassword, key: 'password_confirmation');
  static String? _$dialCode(RegisterParams v) => v.dialCode;
  static const Field<RegisterParams, String> _f$dialCode =
      Field('dialCode', _$dialCode, key: 'dial_code', opt: true);
  static String? _$phone(RegisterParams v) => v.phone;
  static const Field<RegisterParams, String> _f$phone =
      Field('phone', _$phone, opt: true);

  @override
  final MappableFields<RegisterParams> fields = const {
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #subscribeNews: _f$subscribeNews,
    #countryId: _f$countryId,
    #password: _f$password,
    #confirmPassword: _f$confirmPassword,
    #dialCode: _f$dialCode,
    #phone: _f$phone,
  };

  static RegisterParams _instantiate(DecodingData data) {
    return RegisterParams(
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        email: data.dec(_f$email),
        subscribeNews: data.dec(_f$subscribeNews),
        countryId: data.dec(_f$countryId),
        password: data.dec(_f$password),
        confirmPassword: data.dec(_f$confirmPassword),
        dialCode: data.dec(_f$dialCode),
        phone: data.dec(_f$phone));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterParams>(map);
  }

  static RegisterParams fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterParams>(json);
  }
}

mixin RegisterParamsMappable {
  String toJson() {
    return RegisterParamsMapper.ensureInitialized()
        .encodeJson<RegisterParams>(this as RegisterParams);
  }

  Map<String, dynamic> toMap() {
    return RegisterParamsMapper.ensureInitialized()
        .encodeMap<RegisterParams>(this as RegisterParams);
  }

  RegisterParamsCopyWith<RegisterParams, RegisterParams, RegisterParams>
      get copyWith => _RegisterParamsCopyWithImpl(
          this as RegisterParams, $identity, $identity);
  @override
  String toString() {
    return RegisterParamsMapper.ensureInitialized()
        .stringifyValue(this as RegisterParams);
  }

  @override
  bool operator ==(Object other) {
    return RegisterParamsMapper.ensureInitialized()
        .equalsValue(this as RegisterParams, other);
  }

  @override
  int get hashCode {
    return RegisterParamsMapper.ensureInitialized()
        .hashValue(this as RegisterParams);
  }
}

extension RegisterParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterParams, $Out> {
  RegisterParamsCopyWith<$R, RegisterParams, $Out> get $asRegisterParams =>
      $base.as((v, t, t2) => _RegisterParamsCopyWithImpl(v, t, t2));
}

abstract class RegisterParamsCopyWith<$R, $In extends RegisterParams, $Out>
    implements BaseUserInfoCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? firstName,
      String? lastName,
      String? email,
      bool? subscribeNews,
      int? countryId,
      String? password,
      String? confirmPassword,
      String? dialCode,
      String? phone});
  RegisterParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RegisterParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterParams, $Out>
    implements RegisterParamsCopyWith<$R, RegisterParams, $Out> {
  _RegisterParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterParams> $mapper =
      RegisterParamsMapper.ensureInitialized();
  @override
  $R call(
          {String? firstName,
          String? lastName,
          String? email,
          bool? subscribeNews,
          int? countryId,
          String? password,
          String? confirmPassword,
          Object? dialCode = $none,
          Object? phone = $none}) =>
      $apply(FieldCopyWithData({
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName,
        if (email != null) #email: email,
        if (subscribeNews != null) #subscribeNews: subscribeNews,
        if (countryId != null) #countryId: countryId,
        if (password != null) #password: password,
        if (confirmPassword != null) #confirmPassword: confirmPassword,
        if (dialCode != $none) #dialCode: dialCode,
        if (phone != $none) #phone: phone
      }));
  @override
  RegisterParams $make(CopyWithData data) => RegisterParams(
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      email: data.get(#email, or: $value.email),
      subscribeNews: data.get(#subscribeNews, or: $value.subscribeNews),
      countryId: data.get(#countryId, or: $value.countryId),
      password: data.get(#password, or: $value.password),
      confirmPassword: data.get(#confirmPassword, or: $value.confirmPassword),
      dialCode: data.get(#dialCode, or: $value.dialCode),
      phone: data.get(#phone, or: $value.phone));

  @override
  RegisterParamsCopyWith<$R2, RegisterParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterParamsCopyWithImpl($value, $cast, t);
}
