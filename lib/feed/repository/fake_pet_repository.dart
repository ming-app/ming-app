import '../models/pet.dart';
import 'pet_repository.dart';

class FakePetRepository extends PetRepository {
  @override
  Future<List<Pet>> fetchPetList() async {
    return [
      Pet(
        "1",
        "멍멍이",
        "2020-03-12",
        [
          "https://img.huffingtonpost.com/asset/5ec601832500000f1eeb1d4f.jpeg?cache=WuaLzjSHpx&ops=1778_1000",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdlRuOvVAv_bSsIvU1ASyersi7c_2DOp680-tHNEAS_CoyzduazdaOAxNQ0SUy7Wp5QdQ&usqp=CAU",
        ],
        "귀여워요.",
      ),
      Pet(
        "2",
        "야옹이",
        "2020-03-11",
        [
          "https://newsimg-hams.hankookilbo.com/2021/11/09/15423494-2006-403b-a665-6969a7b1aaa1.jpg",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0RMi02AJYxMJP53Ev0LX64rDa5If1dYjlLSumlX4EZcoiWxRfY2uO56M-jnveV3Yis0&usqp=CAU",
        ],
        "이쁨.",
      ),
    ];
  }
}
