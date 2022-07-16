import 'package:flutter_test/flutter_test.dart';
import 'package:ming_api/model/model.dart';
import 'package:ming_api/repository/ming_api_repository.dart';

void main() {
  group("Api Integratino test", () {
    late MingApiRepository api;

    setUp(() {
      api = MingApiRepository(logging: true);
    });

    test("Test Shelter overview Api", () async {
      final result = await api.getShelterOverview();

      expect(result.first, isA<OverviewResponse>());
      expect(result.first.count > 0, true);
    });
  });
}
