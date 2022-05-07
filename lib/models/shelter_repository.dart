import 'package:ming/entities/shelter.dart';

/**
 * 보호소 관련 repository
 */
abstract class ShelterRepository {
  /**
   * 권한이 있는 보호소 목록을 가지고 옴
   */
  Future<List<Shelter>> getShelters(String userId);
}
