import 'package:ming/entities/animal.dart';

import '../entities/pet.dart';

/**
 * 보호동물 관련 repository
 */
abstract class AnimalRepository {
  /**
   * 보호소에 속한 동물들을 가지고 옴
   * TODO : 현재는 animal 객체 전부를 뿌려주지만, 이 부분을 보호소별 동물 list view에서 필요한
   * 데이터만 보여주고 그 외 데이터는 개별 animal을 가지고 오는 method로 처리할 필요 없는지 확인
   */
  Future<List<Animal>> getAnimals(String shelterId);
}
