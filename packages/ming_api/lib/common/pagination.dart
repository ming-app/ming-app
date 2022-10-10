import 'package:json_annotation/json_annotation.dart';
import 'package:ming_api/entities/image.dart';

import '../entities/entities.dart';
import 'utils.dart';

part 'pagination.g.dart';

@JsonSerializable(explicitToJson: true)
class Page<T> {
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

  Page(
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

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}

class _Converter<T> implements JsonConverter<T?, Map<String, dynamic>> {
  const _Converter();

  @override
  T fromJson(Map<String, dynamic>? json) {
    if (json == null) return null as T;

    if (typesEqual<T, ShelterReviewResponse>()) {
      return ShelterReviewResponse.fromJson(json) as T;
    } else if (typesEqual<T, ShelterInfoResponse>()) {
      return ShelterInfoResponse.fromJson(json) as T;
    } else if (typesEqual<T, ShelterImagesResponse>()) {
      return ShelterImagesResponse.fromJson(json) as T;
    } else if (typesEqual<T, AnimalOverviewResponse>()) {
      return AnimalOverviewResponse.fromJson(json) as T;
    } else if (typesEqual<T, AnimalJournalResponse>()) {
      return AnimalJournalResponse.fromJson(json) as T;
    } else if (typesEqual<T, ImageResponse>()) {
      return ImageResponse.fromJson(json) as T;
    }

    throw FormatException("No valid structure for json $json");
  }

  @override
  Map<String, dynamic> toJson(T? object) => object as Map<String, dynamic>;
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
