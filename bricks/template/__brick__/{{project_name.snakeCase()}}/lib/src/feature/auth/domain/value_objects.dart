import 'package:dart_mappable/dart_mappable.dart';

part 'value_objects.mapper.dart';

@MappableEnum()
enum Role {
  guest,
  user;

  const Role();
}
