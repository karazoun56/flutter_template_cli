import 'package:dart_mappable/dart_mappable.dart';

part 'pagination_params.mapper.dart';

@MappableClass()
class PaginatedPageParams with PaginatedPageParamsMappable {
  PaginatedPageParams({
    required this.page,
    @MappableField(key: 'per_page') this.limit = 10,
    @MappableField(key: 'order') this.typeSorting,
    // @MappableField(key: 'sort_by') this.pageSort = PageSort.,
    this.search,
  });

  final int page;
  final int limit;
  final TypeSorting? typeSorting;
  String? search;
}

@MappableEnum()
enum PageSort {
  @MappableValue('none')
  rank,
  @MappableValue('price')
  price,
  @MappableValue('selected')
  selected,
  @MappableValue('points')
  points,
}

@MappableEnum()
enum TypeSorting {
  @MappableValue('asc')
  ascending,
  @MappableValue('desc')
  descending;
}
