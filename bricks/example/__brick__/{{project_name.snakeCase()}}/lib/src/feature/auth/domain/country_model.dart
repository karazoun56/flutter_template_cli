import 'package:dart_mappable/dart_mappable.dart';

part 'country_model.mapper.dart';
// dcm

@MappableClass()
class Countries with CountriesMappable {
  const Countries(this.items);
  final List<Country> items;
}

@MappableClass()
class Country with CountryMappable {
  const Country({
    required this.name,
    required this.code,
    required this.id,
  });

  final String name;
  final String code;
  final int id;
}
