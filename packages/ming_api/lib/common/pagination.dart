import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(explicitToJson: true)
class PageImpl<T> {
  @_Converter()
  final List<T> content;
  final bool empty;
  final bool first;
  final bool last;
  final int number;
  final int numberOfElements;
  final int size;
  final int totalElements;
  final int totalPages;
  final Pageable pageable;
  final Sort sort;

  PageImpl(
    this.content,
    this.empty,
    this.first,
    this.last,
    this.number,
    this.numberOfElements,
    this.size,
    this.totalElements,
    this.totalPages,
    this.pageable,
    this.sort,
  );

  factory PageImpl.fromJson(Map<String, dynamic> json) =>
      _$PageImplFromJson(json);
  Map<String, dynamic> toJson() => _$PageImplToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      // todo: handle converter for each corresponding generics.
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}

@JsonSerializable(explicitToJson: true)
class Pageable {
  final int offset;
  final int pageNumber;
  final int pageSize;
  final bool paged;
  final bool unpaged;
  final Sort sort;

  Pageable(
    this.offset,
    this.pageNumber,
    this.pageSize,
    this.paged,
    this.unpaged,
    this.sort,
  );

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
  Map<String, dynamic> toJson() => _$PageableToJson(this);
}

@JsonSerializable()
class Sort {
  final bool empty;
  final bool sorted;
  final bool unsorted;

  Sort(this.empty, this.sorted, this.unsorted);

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
  Map<String, dynamic> toJson() => _$SortToJson(this);
}
