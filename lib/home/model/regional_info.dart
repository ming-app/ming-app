import 'package:flutter/material.dart';
import 'package:ming_api/model/model.dart';

class RegionalInfo {
  final String name;
  final int shelterCount;
  final List<Image> userImages;
  final int volunteerCount;
  final String slug; // slug to route with query

  RegionalInfo(
    this.name,
    this.shelterCount,
    this.userImages,
    this.volunteerCount,
    this.slug,
  );

  factory RegionalInfo.fromOverview(OverviewResponse response) {
    return RegionalInfo(
      response.region.fullName,
      response.count,
      response.volunteerOverview.thumbnailUrl
          .map((e) => Image.network(e))
          .toList(),
      response.volunteerOverview.count,
      response.region.id,
    );
  }
}
