// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    const id = 'mock-id';
    const email = 'mock-email';

    test('uses value equality', () {
      expect(
        AuthInfo(email: email, id: id),
        equals(AuthInfo(email: email, id: id)),
      );
    });

    test('isEmpty returns true for empty user', () {
      expect(AuthInfo.empty.isEmpty, isTrue);
    });

    test('isEmpty returns false for non-empty user', () {
      final user = AuthInfo(email: email, id: id);
      expect(user.isEmpty, isFalse);
    });

    test('isNotEmpty returns false for empty user', () {
      expect(AuthInfo.empty.isNotEmpty, isFalse);
    });

    test('isNotEmpty returns true for non-empty user', () {
      final user = AuthInfo(email: email, id: id);
      expect(user.isNotEmpty, isTrue);
    });
  });
}
