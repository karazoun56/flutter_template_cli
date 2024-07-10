import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/model/base_user_info.dart';
import 'value_objects.dart';

part 'user_model.mapper.dart';

@MappableClass()
class User extends BaseUserInfo with UserMappable {
  const User({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.dialCode,
    required super.phone,
    required super.subscribeNews,
    @MappableField(key: 'full_name') required this.fullName,
    @MappableField(key: 'phone_number') required this.phoneNumber,
    @MappableField(key: 'image') required this.imageUrl,
    this.role = Role.user,
  });

  final String fullName;
  final String phoneNumber;
  final String imageUrl;
  final Role role;
}
