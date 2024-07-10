// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'value_objects.dart';

class RoleMapper extends EnumMapper<Role> {
  RoleMapper._();

  static RoleMapper? _instance;
  static RoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleMapper._());
    }
    return _instance!;
  }

  static Role fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Role decode(dynamic value) {
    switch (value) {
      case 'guest':
        return Role.guest;
      case 'user':
        return Role.user;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Role self) {
    switch (self) {
      case Role.guest:
        return 'guest';
      case Role.user:
        return 'user';
    }
  }
}

extension RoleMapperExtension on Role {
  String toValue() {
    RoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Role>(this) as String;
  }
}
