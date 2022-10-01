// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page<T> _$PageFromJson<T>(Map<String, dynamic> json) => Page<T>(
      (json['content'] as List<dynamic>)
          .map((e) => _Converter<T>().fromJson(e as Map<String, dynamic>))
          .toList(),
      json['empty'] as bool,
      json['first'] as bool,
      json['last'] as bool,
      json['number'] as int,
      json['numberOfElements'] as int,
      json['size'] as int,
      json['totalElements'] as int,
      json['totalPages'] as int,
      Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      Sort.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageToJson<T>(Page<T> instance) => <String, dynamic>{
      'content': instance.content.map(_Converter<T>().toJson).toList(),
      'empty': instance.empty,
      'first': instance.first,
      'last': instance.last,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'pageable': instance.pageable.toJson(),
      'sort': instance.sort.toJson(),
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      json['offset'] as int,
      json['pageNumber'] as int,
      json['pageSize'] as int,
      json['paged'] as bool,
      json['unpaged'] as bool,
      Sort.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'offset': instance.offset,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
      'sort': instance.sort.toJson(),
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      json['empty'] as bool,
      json['sorted'] as bool,
      json['unsorted'] as bool,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };
