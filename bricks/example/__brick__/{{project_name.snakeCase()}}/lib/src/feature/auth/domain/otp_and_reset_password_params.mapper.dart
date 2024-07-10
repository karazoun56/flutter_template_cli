// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'otp_and_reset_password_params.dart';

class OtpTypeMapper extends EnumMapper<OtpType> {
  OtpTypeMapper._();

  static OtpTypeMapper? _instance;
  static OtpTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OtpTypeMapper._());
    }
    return _instance!;
  }

  static OtpType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  OtpType decode(dynamic value) {
    switch (value) {
      case 'verify_email':
        return OtpType.verifyEmail;
      case 'reset_password':
        return OtpType.resetPassword;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(OtpType self) {
    switch (self) {
      case OtpType.verifyEmail:
        return 'verify_email';
      case OtpType.resetPassword:
        return 'reset_password';
    }
  }
}

extension OtpTypeMapperExtension on OtpType {
  dynamic toValue() {
    OtpTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<OtpType>(this);
  }
}

class OtpBaseMapper extends ClassMapperBase<OtpBase> {
  OtpBaseMapper._();

  static OtpBaseMapper? _instance;
  static OtpBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OtpBaseMapper._());
      SendOtpParamsMapper.ensureInitialized();
      VerifyOtpParamsMapper.ensureInitialized();
      OtpTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OtpBase';

  static String _$email(OtpBase v) => v.email;
  static const Field<OtpBase, String> _f$email = Field('email', _$email);
  static OtpType _$type(OtpBase v) => v.type;
  static const Field<OtpBase, OtpType> _f$type = Field('type', _$type);

  @override
  final MappableFields<OtpBase> fields = const {
    #email: _f$email,
    #type: _f$type,
  };

  static OtpBase _instantiate(DecodingData data) {
    return OtpBase(email: data.dec(_f$email), type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static OtpBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OtpBase>(map);
  }

  static OtpBase fromJson(String json) {
    return ensureInitialized().decodeJson<OtpBase>(json);
  }
}

mixin OtpBaseMappable {
  String toJson() {
    return OtpBaseMapper.ensureInitialized()
        .encodeJson<OtpBase>(this as OtpBase);
  }

  Map<String, dynamic> toMap() {
    return OtpBaseMapper.ensureInitialized()
        .encodeMap<OtpBase>(this as OtpBase);
  }

  OtpBaseCopyWith<OtpBase, OtpBase, OtpBase> get copyWith =>
      _OtpBaseCopyWithImpl(this as OtpBase, $identity, $identity);
  @override
  String toString() {
    return OtpBaseMapper.ensureInitialized().stringifyValue(this as OtpBase);
  }

  @override
  bool operator ==(Object other) {
    return OtpBaseMapper.ensureInitialized()
        .equalsValue(this as OtpBase, other);
  }

  @override
  int get hashCode {
    return OtpBaseMapper.ensureInitialized().hashValue(this as OtpBase);
  }
}

extension OtpBaseValueCopy<$R, $Out> on ObjectCopyWith<$R, OtpBase, $Out> {
  OtpBaseCopyWith<$R, OtpBase, $Out> get $asOtpBase =>
      $base.as((v, t, t2) => _OtpBaseCopyWithImpl(v, t, t2));
}

abstract class OtpBaseCopyWith<$R, $In extends OtpBase, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email, OtpType? type});
  OtpBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OtpBaseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OtpBase, $Out>
    implements OtpBaseCopyWith<$R, OtpBase, $Out> {
  _OtpBaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OtpBase> $mapper =
      OtpBaseMapper.ensureInitialized();
  @override
  $R call({String? email, OtpType? type}) => $apply(FieldCopyWithData(
      {if (email != null) #email: email, if (type != null) #type: type}));
  @override
  OtpBase $make(CopyWithData data) => OtpBase(
      email: data.get(#email, or: $value.email),
      type: data.get(#type, or: $value.type));

  @override
  OtpBaseCopyWith<$R2, OtpBase, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OtpBaseCopyWithImpl($value, $cast, t);
}

class SendOtpParamsMapper extends ClassMapperBase<SendOtpParams> {
  SendOtpParamsMapper._();

  static SendOtpParamsMapper? _instance;
  static SendOtpParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendOtpParamsMapper._());
      OtpBaseMapper.ensureInitialized();
      OtpTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SendOtpParams';

  static String _$email(SendOtpParams v) => v.email;
  static const Field<SendOtpParams, String> _f$email = Field('email', _$email);
  static OtpType _$type(SendOtpParams v) => v.type;
  static const Field<SendOtpParams, OtpType> _f$type = Field('type', _$type);

  @override
  final MappableFields<SendOtpParams> fields = const {
    #email: _f$email,
    #type: _f$type,
  };

  static SendOtpParams _instantiate(DecodingData data) {
    return SendOtpParams(email: data.dec(_f$email), type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static SendOtpParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendOtpParams>(map);
  }

  static SendOtpParams fromJson(String json) {
    return ensureInitialized().decodeJson<SendOtpParams>(json);
  }
}

mixin SendOtpParamsMappable {
  String toJson() {
    return SendOtpParamsMapper.ensureInitialized()
        .encodeJson<SendOtpParams>(this as SendOtpParams);
  }

  Map<String, dynamic> toMap() {
    return SendOtpParamsMapper.ensureInitialized()
        .encodeMap<SendOtpParams>(this as SendOtpParams);
  }

  SendOtpParamsCopyWith<SendOtpParams, SendOtpParams, SendOtpParams>
      get copyWith => _SendOtpParamsCopyWithImpl(
          this as SendOtpParams, $identity, $identity);
  @override
  String toString() {
    return SendOtpParamsMapper.ensureInitialized()
        .stringifyValue(this as SendOtpParams);
  }

  @override
  bool operator ==(Object other) {
    return SendOtpParamsMapper.ensureInitialized()
        .equalsValue(this as SendOtpParams, other);
  }

  @override
  int get hashCode {
    return SendOtpParamsMapper.ensureInitialized()
        .hashValue(this as SendOtpParams);
  }
}

extension SendOtpParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendOtpParams, $Out> {
  SendOtpParamsCopyWith<$R, SendOtpParams, $Out> get $asSendOtpParams =>
      $base.as((v, t, t2) => _SendOtpParamsCopyWithImpl(v, t, t2));
}

abstract class SendOtpParamsCopyWith<$R, $In extends SendOtpParams, $Out>
    implements OtpBaseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? email, OtpType? type});
  SendOtpParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SendOtpParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendOtpParams, $Out>
    implements SendOtpParamsCopyWith<$R, SendOtpParams, $Out> {
  _SendOtpParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendOtpParams> $mapper =
      SendOtpParamsMapper.ensureInitialized();
  @override
  $R call({String? email, OtpType? type}) => $apply(FieldCopyWithData(
      {if (email != null) #email: email, if (type != null) #type: type}));
  @override
  SendOtpParams $make(CopyWithData data) => SendOtpParams(
      email: data.get(#email, or: $value.email),
      type: data.get(#type, or: $value.type));

  @override
  SendOtpParamsCopyWith<$R2, SendOtpParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SendOtpParamsCopyWithImpl($value, $cast, t);
}

class VerifyOtpParamsMapper extends ClassMapperBase<VerifyOtpParams> {
  VerifyOtpParamsMapper._();

  static VerifyOtpParamsMapper? _instance;
  static VerifyOtpParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerifyOtpParamsMapper._());
      OtpBaseMapper.ensureInitialized();
      OtpTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyOtpParams';

  static String _$otp(VerifyOtpParams v) => v.otp;
  static const Field<VerifyOtpParams, String> _f$otp = Field('otp', _$otp);
  static String _$email(VerifyOtpParams v) => v.email;
  static const Field<VerifyOtpParams, String> _f$email =
      Field('email', _$email);
  static OtpType _$type(VerifyOtpParams v) => v.type;
  static const Field<VerifyOtpParams, OtpType> _f$type = Field('type', _$type);

  @override
  final MappableFields<VerifyOtpParams> fields = const {
    #otp: _f$otp,
    #email: _f$email,
    #type: _f$type,
  };

  static VerifyOtpParams _instantiate(DecodingData data) {
    return VerifyOtpParams(
        otp: data.dec(_f$otp),
        email: data.dec(_f$email),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyOtpParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyOtpParams>(map);
  }

  static VerifyOtpParams fromJson(String json) {
    return ensureInitialized().decodeJson<VerifyOtpParams>(json);
  }
}

mixin VerifyOtpParamsMappable {
  String toJson() {
    return VerifyOtpParamsMapper.ensureInitialized()
        .encodeJson<VerifyOtpParams>(this as VerifyOtpParams);
  }

  Map<String, dynamic> toMap() {
    return VerifyOtpParamsMapper.ensureInitialized()
        .encodeMap<VerifyOtpParams>(this as VerifyOtpParams);
  }

  VerifyOtpParamsCopyWith<VerifyOtpParams, VerifyOtpParams, VerifyOtpParams>
      get copyWith => _VerifyOtpParamsCopyWithImpl(
          this as VerifyOtpParams, $identity, $identity);
  @override
  String toString() {
    return VerifyOtpParamsMapper.ensureInitialized()
        .stringifyValue(this as VerifyOtpParams);
  }

  @override
  bool operator ==(Object other) {
    return VerifyOtpParamsMapper.ensureInitialized()
        .equalsValue(this as VerifyOtpParams, other);
  }

  @override
  int get hashCode {
    return VerifyOtpParamsMapper.ensureInitialized()
        .hashValue(this as VerifyOtpParams);
  }
}

extension VerifyOtpParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyOtpParams, $Out> {
  VerifyOtpParamsCopyWith<$R, VerifyOtpParams, $Out> get $asVerifyOtpParams =>
      $base.as((v, t, t2) => _VerifyOtpParamsCopyWithImpl(v, t, t2));
}

abstract class VerifyOtpParamsCopyWith<$R, $In extends VerifyOtpParams, $Out>
    implements OtpBaseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? otp, String? email, OtpType? type});
  VerifyOtpParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VerifyOtpParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyOtpParams, $Out>
    implements VerifyOtpParamsCopyWith<$R, VerifyOtpParams, $Out> {
  _VerifyOtpParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyOtpParams> $mapper =
      VerifyOtpParamsMapper.ensureInitialized();
  @override
  $R call({String? otp, String? email, OtpType? type}) =>
      $apply(FieldCopyWithData({
        if (otp != null) #otp: otp,
        if (email != null) #email: email,
        if (type != null) #type: type
      }));
  @override
  VerifyOtpParams $make(CopyWithData data) => VerifyOtpParams(
      otp: data.get(#otp, or: $value.otp),
      email: data.get(#email, or: $value.email),
      type: data.get(#type, or: $value.type));

  @override
  VerifyOtpParamsCopyWith<$R2, VerifyOtpParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VerifyOtpParamsCopyWithImpl($value, $cast, t);
}

class ResetPasswordParamsMapper extends ClassMapperBase<ResetPasswordParams> {
  ResetPasswordParamsMapper._();

  static ResetPasswordParamsMapper? _instance;
  static ResetPasswordParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResetPasswordParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResetPasswordParams';

  static String _$email(ResetPasswordParams v) => v.email;
  static const Field<ResetPasswordParams, String> _f$email =
      Field('email', _$email);
  static String _$otp(ResetPasswordParams v) => v.otp;
  static const Field<ResetPasswordParams, String> _f$otp = Field('otp', _$otp);
  static String _$password(ResetPasswordParams v) => v.password;
  static const Field<ResetPasswordParams, String> _f$password =
      Field('password', _$password);
  static String _$confirmPassword(ResetPasswordParams v) => v.confirmPassword;
  static const Field<ResetPasswordParams, String> _f$confirmPassword =
      Field('confirmPassword', _$confirmPassword, key: 'password_confirmation');

  @override
  final MappableFields<ResetPasswordParams> fields = const {
    #email: _f$email,
    #otp: _f$otp,
    #password: _f$password,
    #confirmPassword: _f$confirmPassword,
  };

  static ResetPasswordParams _instantiate(DecodingData data) {
    return ResetPasswordParams(
        email: data.dec(_f$email),
        otp: data.dec(_f$otp),
        password: data.dec(_f$password),
        confirmPassword: data.dec(_f$confirmPassword));
  }

  @override
  final Function instantiate = _instantiate;

  static ResetPasswordParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResetPasswordParams>(map);
  }

  static ResetPasswordParams fromJson(String json) {
    return ensureInitialized().decodeJson<ResetPasswordParams>(json);
  }
}

mixin ResetPasswordParamsMappable {
  String toJson() {
    return ResetPasswordParamsMapper.ensureInitialized()
        .encodeJson<ResetPasswordParams>(this as ResetPasswordParams);
  }

  Map<String, dynamic> toMap() {
    return ResetPasswordParamsMapper.ensureInitialized()
        .encodeMap<ResetPasswordParams>(this as ResetPasswordParams);
  }

  ResetPasswordParamsCopyWith<ResetPasswordParams, ResetPasswordParams,
          ResetPasswordParams>
      get copyWith => _ResetPasswordParamsCopyWithImpl(
          this as ResetPasswordParams, $identity, $identity);
  @override
  String toString() {
    return ResetPasswordParamsMapper.ensureInitialized()
        .stringifyValue(this as ResetPasswordParams);
  }

  @override
  bool operator ==(Object other) {
    return ResetPasswordParamsMapper.ensureInitialized()
        .equalsValue(this as ResetPasswordParams, other);
  }

  @override
  int get hashCode {
    return ResetPasswordParamsMapper.ensureInitialized()
        .hashValue(this as ResetPasswordParams);
  }
}

extension ResetPasswordParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResetPasswordParams, $Out> {
  ResetPasswordParamsCopyWith<$R, ResetPasswordParams, $Out>
      get $asResetPasswordParams =>
          $base.as((v, t, t2) => _ResetPasswordParamsCopyWithImpl(v, t, t2));
}

abstract class ResetPasswordParamsCopyWith<$R, $In extends ResetPasswordParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? email, String? otp, String? password, String? confirmPassword});
  ResetPasswordParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ResetPasswordParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResetPasswordParams, $Out>
    implements ResetPasswordParamsCopyWith<$R, ResetPasswordParams, $Out> {
  _ResetPasswordParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResetPasswordParams> $mapper =
      ResetPasswordParamsMapper.ensureInitialized();
  @override
  $R call(
          {String? email,
          String? otp,
          String? password,
          String? confirmPassword}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (otp != null) #otp: otp,
        if (password != null) #password: password,
        if (confirmPassword != null) #confirmPassword: confirmPassword
      }));
  @override
  ResetPasswordParams $make(CopyWithData data) => ResetPasswordParams(
      email: data.get(#email, or: $value.email),
      otp: data.get(#otp, or: $value.otp),
      password: data.get(#password, or: $value.password),
      confirmPassword: data.get(#confirmPassword, or: $value.confirmPassword));

  @override
  ResetPasswordParamsCopyWith<$R2, ResetPasswordParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ResetPasswordParamsCopyWithImpl($value, $cast, t);
}
