import 'package:flutter/material.dart';
import '../model/regional_info.dart';

// Regional information mock
final regions = [
  RegionalInfo("서울특별시", 10, userThumbnails, 100, "seoul"),
  RegionalInfo("부산광역시", 4, userThumbnails, 100, "busan"),
  RegionalInfo("광주광역시", 23, userThumbnails, 666, "gwangju"),
  RegionalInfo("경기도", 1, userThumbnails, 77, "gyeonggi"),
  RegionalInfo("강원도", 8, userThumbnails, 44, "kangwon"),
];

final userThumbnails = [
  Image.asset('assets/mocks/user1.png'),
  Image.asset('assets/mocks/user2.png'),
  Image.asset('assets/mocks/user3.png'),
];
