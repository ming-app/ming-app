import 'package:flutter_test/flutter_test.dart';
import 'package:ming/feed/feed.dart';

void main() {
  group('Fake Pet Repository Test', () {
    test('Fetch pet list test', () async {
      PetRepository repository = petRepository;

      var pets = await repository.fetchPetList();
      expect(pets.length, 2);
      expect(pets[0].name, "멍멍이");
    });
  });
}
