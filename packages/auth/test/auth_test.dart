import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:auth/auth.dart';
import 'package:hive/hive.dart';

void main() {
  test('adds one to input values', () {
    var random = Hive.generateSecureKey();
    var string = base64UrlEncode(random);
    print(string);
  });
}
