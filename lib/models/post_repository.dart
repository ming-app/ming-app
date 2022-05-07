import 'package:ming/entities/animal.dart';

import '../entities/pet.dart';
import '../entities/post.dart';

/**
 * 게시물 관련 repository
 */
abstract class PostRepository {
  /**
   * 포스트를 가지고 옴
   * TODO : post 1건에 대한 select 필요할지 확인
   */
  Future<List<Post>> getPostsByUserId(String userId);

  /**
   * 포스트들 읽음 처리
   */
  void markRead(String userId, List<String> postIds);

  /**
   * 특정 보호동물에 대한 게시글 가지고오기
   */
  Future<List<Post>> getPostsByAnimalId(String animalId);
}
