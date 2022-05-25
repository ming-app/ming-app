import 'package:json_annotation/json_annotation.dart';

part 'timestamp.g.dart';

@JsonSerializable()
class TimeStamp {
  final int? date;
  final int? day;
  final int? hours;
  final int? minutes;
  final int? month;
  final int? nanos;
  final int? seconds;
  final int? time;
  final int? timezoneOffset;
  final int? year;

  TimeStamp({
    this.year,
    this.month,
    this.day,
    this.date,
    this.hours,
    this.minutes,
    this.seconds,
    this.nanos,
    this.time,
    this.timezoneOffset,
  });

  factory TimeStamp.fromJson(Map<String, dynamic> json) =>
      _$TimeStampFromJson(json);
  Map<String, dynamic> toJson() => _$TimeStampToJson(this);
}
