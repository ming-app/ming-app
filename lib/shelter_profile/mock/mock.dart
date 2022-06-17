import 'package:ming/shelter_profile/model/pet_profile.dart';

import '../model/shelter_profile.dart';

final shelterMock = ShelterProfile(
  name: "밍 보호소",
  numberOfCats: 30,
  numberOfDogs: 23,
  numberOfVolunteers: 4,
  averageRate: 4.3,
  reviewCount: 8,
  region: "서울특별시 강남구",
  desc: """
    동물자유연대는 동물운동에 대한 사회 인식과 기반이 전혀 마련되어 있지 않던 2000년에 자원봉사를 구성해 활동을 해 나가던 중, 그 한계를 넘어서기를 바라는 회원들의 마음을 모아 2001년에 동물운동단체로서는 처음 서울에 사무실을 마련하였고 상근활동가를 구성하는 등 동물운동의 체계화를 구축하기 시작했습니다.
    동물자유연대는 우리 사회에 ‘유기동물 입양 문화’를 선도해 나갔고, 동물보호 관련법 개정 및 제정, 농장동물복지 활동, 화장품 동물실험 중단을 위한 활동, 제돌이를 비롯해 공연장 돌고래 3마리를 바다로 돌려보내는 등 다양한 영역에서 활발한 활동을 하고 있습니다. 이 모든 것은 동물들이 보다 더 나은 삶을 살기를 바라는 따뜻한 마음들이 모여져 가능할 수 있었습니다.
    오늘날 전 세계적으로 700억여 마리의 동물들이 인간에 의해 태어나고 죽음에 이르고 있습니다.
    그 과정에서 동물이 고통과 감성을 느끼는 존재라는 것은 고려되지 않아, 동물들은 태어나는 순간부터 본연의 습성이 차단된 채 비좁은 우리에서 갇혀 살다가 고통스러운 과정을 거쳐 생을 마감하게 됩니다.
    산업화된 동물이용은 서구사회로부터 시작됐습니다. 하지만 그로 인해 생명체에 대한 존중감은 점차 둔해지고, 환경 폐해, 식품 안전 문제 등 다양한 부작용이 생겼으며, 이는 자성의 소리로 이어져 정책 변화로 이어지고 있습니다. 국제사회는 동물복지를 중요한 가치로 논의하고 있으며 동물 쇼처럼 인간 유희를 위한 동물 이용을 금지하는 나라들이 늘어가고 있습니다.
    우리 사회도 이에 눈을 돌릴 차례입니다. 한국에서도 연간 8억 마리 이상의 동물들이 인위적으로 태어나고 죽습니다. 그들이 어떻게 살다가 죽는지 우리는 관심을 가지며 개선해야 할 필요가 있고, 동물 희생을 최소화하는 노력을 해야 합니다. 이것은 생명체를 대하는 인간의 도덕성의 문제와도 관계됩니다.
    우리 미래 세대에게 진정한 가치 사회를 이어주고 동물들이 웃을 수 있는 사회가 되기 위해 동물자유연대가 최선의 노력을 하겠습니다. 동물자유연대에 지속적인 관심과 격려로 함께 해주세요.
  """
      .trim(),
  manager: ShelterManagerProfile(
      name: "김밍밍",
      phoneNumber: "010-0000-0000",
      imageUrl:
          "http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQpdqkqzmosP1-W1JFKQ4NSlYrF-Nzd4PjE7MDVgqHPED-Y8t3UP0f7fgAWgqIdoeHd"),
);

final petsMock = [
  PetProfile(
    name: "가디",
    isFemale: true,
    age: 3,
    desc: "아주 귀여워요.",
    numberOfVolunteer: 3,
    imageUrl:
        "https://static.wikia.nocookie.net/pokemon/images/b/bd/%EA%B0%80%EB%94%94_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest?cb=20170405012026&path-prefix=ko",
  ),
  PetProfile(
    name: "이브이",
    isFemale: true,
    age: 6,
    desc: "아주 귀여워요.",
    numberOfVolunteer: 3,
    imageUrl:
        "https://static.wikia.nocookie.net/pokemon/images/3/3f/%EC%9D%B4%EB%B8%8C%EC%9D%B4_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest?cb=20170405085011&path-prefix=ko",
  ),
];

final shelterPhotosMock = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6jhhs9GGC2CNFv6kwjmjtog8FX2DHIkhnNQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFd95Y9Uy8xw6WYdyvi1wwerujC2egOM-xqw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6jhhs9GGC2CNFv6kwjmjtog8FX2DHIkhnNQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFd95Y9Uy8xw6WYdyvi1wwerujC2egOM-xqw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6jhhs9GGC2CNFv6kwjmjtog8FX2DHIkhnNQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFd95Y9Uy8xw6WYdyvi1wwerujC2egOM-xqw&usqp=CAU",
];
