// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
      BaseUserInfoMapper.ensureInitialized();
      RoleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$firstName(User v) => v.firstName;
  static const Field<User, String> _f$firstName =
      Field('firstName', _$firstName, key: 'first_name');
  static String _$lastName(User v) => v.lastName;
  static const Field<User, String> _f$lastName =
      Field('lastName', _$lastName, key: 'last_name');
  static String _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field('email', _$email);
  static String? _$dialCode(User v) => v.dialCode;
  static const Field<User, String> _f$dialCode =
      Field('dialCode', _$dialCode, key: 'dial_code');
  static String? _$phone(User v) => v.phone;
  static const Field<User, String> _f$phone = Field('phone', _$phone);
  static bool _$subscribeNews(User v) => v.subscribeNews;
  static const Field<User, bool> _f$subscribeNews =
      Field('subscribeNews', _$subscribeNews, key: 'subscribe_news');
  static String _$fullName(User v) => v.fullName;
  static const Field<User, String> _f$fullName =
      Field('fullName', _$fullName, key: 'full_name');
  static String _$phoneNumber(User v) => v.phoneNumber;
  static const Field<User, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, key: 'phone_number');
  static String _$imageUrl(User v) => v.imageUrl;
  static const Field<User, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl, key: 'image');
  static Role _$role(User v) => v.role;
  static const Field<User, Role> _f$role =
      Field('role', _$role, opt: true, def: Role.user);

  @override
  final MappableFields<User> fields = const {
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #dialCode: _f$dialCode,
    #phone: _f$phone,
    #subscribeNews: _f$subscribeNews,
    #fullName: _f$fullName,
    #phoneNumber: _f$phoneNumber,
    #imageUrl: _f$imageUrl,
    #role: _f$role,
  };

  static User _instantiate(DecodingData data) {
    return User(
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        email: data.dec(_f$email),
        dialCode: data.dec(_f$dialCode),
        phone: data.dec(_f$phone),
        subscribeNews: data.dec(_f$subscribeNews),
        fullName: data.dec(_f$fullName),
        phoneNumber: data.dec(_f$phoneNumber),
        imageUrl: data.dec(_f$imageUrl),
        role: data.dec(_f$role));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements BaseUserInfoCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? firstName,
      String? lastName,
      String? email,
      String? dialCode,
      String? phone,
      bool? subscribeNews,
      String? fullName,
      String? phoneNumber,
      String? imageUrl,
      Role? role});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call(
          {String? firstName,
          String? lastName,
          String? email,
          Object? dialCode = $none,
          Object? phone = $none,
          bool? subscribeNews,
          String? fullName,
          String? phoneNumber,
          String? imageUrl,
          Role? role}) =>
      $apply(FieldCopyWithData({
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName,
        if (email != null) #email: email,
        if (dialCode != $none) #dialCode: dialCode,
        if (phone != $none) #phone: phone,
        if (subscribeNews != null) #subscribeNews: subscribeNews,
        if (fullName != null) #fullName: fullName,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (imageUrl != null) #imageUrl: imageUrl,
        if (role != null) #role: role
      }));
  @override
  User $make(CopyWithData data) => User(
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      email: data.get(#email, or: $value.email),
      dialCode: data.get(#dialCode, or: $value.dialCode),
      phone: data.get(#phone, or: $value.phone),
      subscribeNews: data.get(#subscribeNews, or: $value.subscribeNews),
      fullName: data.get(#fullName, or: $value.fullName),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl),
      role: data.get(#role, or: $value.role));

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl($value, $cast, t);
}
