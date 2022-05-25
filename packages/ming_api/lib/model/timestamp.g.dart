// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timestamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeStamp _$TimeStampFromJson(Map<String, dynamic> json) => TimeStamp(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      date: json['date'] as int?,
      hours: json['hours'] as int?,
      minutes: json['minutes'] as int?,
      seconds: json['seconds'] as int?,
      nanos: json['nanos'] as int?,
      time: json['time'] as int?,
      timezoneOffset: json['timezoneOffset'] as int?,
    );

Map<String, dynamic> _$TimeStampToJson(TimeStamp instance) => <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'hours': instance.hours,
      'minutes': instance.minutes,
      'month': instance.month,
      'nanos': instance.nanos,
      'seconds': instance.seconds,
      'time': instance.time,
      'timezoneOffset': instance.timezoneOffset,
      'year': instance.year,
    };
