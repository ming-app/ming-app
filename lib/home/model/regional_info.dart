import 'package:flutter/material.dart';

class RegionalInfo {
  final String name;
  final int shelterCount;
  final List<Image> userImages;
  final int volunteerCount;

  RegionalInfo(
    this.name,
    this.shelterCount,
    this.userImages,
    this.volunteerCount,
  );
}
