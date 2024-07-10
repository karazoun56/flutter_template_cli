// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'country_model.dart';

class CountriesMapper extends ClassMapperBase<Countries> {
  CountriesMapper._();

  static CountriesMapper? _instance;
  static CountriesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CountriesMapper._());
      CountryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Countries';

  static List<Country> _$items(Countries v) => v.items;
  static const Field<Countries, List<Country>> _f$items =
      Field('items', _$items);

  @override
  final MappableFields<Countries> fields = const {
    #items: _f$items,
  };

  static Countries _instantiate(DecodingData data) {
    return Countries(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static Countries fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Countries>(map);
  }

  static Countries fromJson(String json) {
    return ensureInitialized().decodeJson<Countries>(json);
  }
}

mixin CountriesMappable {
  String toJson() {
    return CountriesMapper.ensureInitialized()
        .encodeJson<Countries>(this as Countries);
  }

  Map<String, dynamic> toMap() {
    return CountriesMapper.ensureInitialized()
        .encodeMap<Countries>(this as Countries);
  }

  CountriesCopyWith<Countries, Countries, Countries> get copyWith =>
      _CountriesCopyWithImpl(this as Countries, $identity, $identity);
  @override
  String toString() {
    return CountriesMapper.ensureInitialized()
        .stringifyValue(this as Countries);
  }

  @override
  bool operator ==(Object other) {
    return CountriesMapper.ensureInitialized()
        .equalsValue(this as Countries, other);
  }

  @override
  int get hashCode {
    return CountriesMapper.ensureInitialized().hashValue(this as Countries);
  }
}

extension CountriesValueCopy<$R, $Out> on ObjectCopyWith<$R, Countries, $Out> {
  CountriesCopyWith<$R, Countries, $Out> get $asCountries =>
      $base.as((v, t, t2) => _CountriesCopyWithImpl(v, t, t2));
}

abstract class CountriesCopyWith<$R, $In extends Countries, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Country, CountryCopyWith<$R, Country, Country>> get items;
  $R call({List<Country>? items});
  CountriesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CountriesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Countries, $Out>
    implements CountriesCopyWith<$R, Countries, $Out> {
  _CountriesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Countries> $mapper =
      CountriesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Country, CountryCopyWith<$R, Country, Country>> get items =>
      ListCopyWith(
          $value.items, (v, t) => v.copyWith.$chain(t), (v) => call(items: v));
  @override
  $R call({List<Country>? items}) =>
      $apply(FieldCopyWithData({if (items != null) #items: items}));
  @override
  Countries $make(CopyWithData data) =>
      Countries(data.get(#items, or: $value.items));

  @override
  CountriesCopyWith<$R2, Countries, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CountriesCopyWithImpl($value, $cast, t);
}

class CountryMapper extends ClassMapperBase<Country> {
  CountryMapper._();

  static CountryMapper? _instance;
  static CountryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CountryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Country';

  static String _$name(Country v) => v.name;
  static const Field<Country, String> _f$name = Field('name', _$name);
  static String _$code(Country v) => v.code;
  static const Field<Country, String> _f$code = Field('code', _$code);
  static int _$id(Country v) => v.id;
  static const Field<Country, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<Country> fields = const {
    #name: _f$name,
    #code: _f$code,
    #id: _f$id,
  };

  static Country _instantiate(DecodingData data) {
    return Country(
        name: data.dec(_f$name), code: data.dec(_f$code), id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static Country fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Country>(map);
  }

  static Country fromJson(String json) {
    return ensureInitialized().decodeJson<Country>(json);
  }
}

mixin CountryMappable {
  String toJson() {
    return CountryMapper.ensureInitialized()
        .encodeJson<Country>(this as Country);
  }

  Map<String, dynamic> toMap() {
    return CountryMapper.ensureInitialized()
        .encodeMap<Country>(this as Country);
  }

  CountryCopyWith<Country, Country, Country> get copyWith =>
      _CountryCopyWithImpl(this as Country, $identity, $identity);
  @override
  String toString() {
    return CountryMapper.ensureInitialized().stringifyValue(this as Country);
  }

  @override
  bool operator ==(Object other) {
    return CountryMapper.ensureInitialized()
        .equalsValue(this as Country, other);
  }

  @override
  int get hashCode {
    return CountryMapper.ensureInitialized().hashValue(this as Country);
  }
}

extension CountryValueCopy<$R, $Out> on ObjectCopyWith<$R, Country, $Out> {
  CountryCopyWith<$R, Country, $Out> get $asCountry =>
      $base.as((v, t, t2) => _CountryCopyWithImpl(v, t, t2));
}

abstract class CountryCopyWith<$R, $In extends Country, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? code, int? id});
  CountryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CountryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Country, $Out>
    implements CountryCopyWith<$R, Country, $Out> {
  _CountryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Country> $mapper =
      CountryMapper.ensureInitialized();
  @override
  $R call({String? name, String? code, int? id}) => $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (code != null) #code: code,
        if (id != null) #id: id
      }));
  @override
  Country $make(CopyWithData data) => Country(
      name: data.get(#name, or: $value.name),
      code: data.get(#code, or: $value.code),
      id: data.get(#id, or: $value.id));

  @override
  CountryCopyWith<$R2, Country, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CountryCopyWithImpl($value, $cast, t);
}
