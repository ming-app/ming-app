import 'package:flutter/material.dart';
import 'package:ming/home/model/regional_info.dart';

// Regional information mock
final regions = [
  RegionalInfo("서울특별시", 10, userThumbnails, 100),
  RegionalInfo("부산광역시", 4, userThumbnails, 100),
  RegionalInfo("광주광역시", 23, userThumbnails, 666),
  RegionalInfo("경기도", 1, userThumbnails, 77),
  RegionalInfo("강원도", 8, userThumbnails, 44),
];

final userThumbnails = [
  Image.asset('assets/mocks/user1.png'),
  Image.asset('assets/mocks/user2.png'),
  Image.asset('assets/mocks/user3.png'),
];
