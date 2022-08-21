import 'package:ming/shelter_profile/model/shelter_profile.dart';

import '../model/shelters_info.dart';

final mockShelters = [
  ShelterProfile(
    name: "보호소 이름1",
    numberOfCats: 3,
    numberOfDogs: 20,
    numberOfVolunteers: 4,
    thumbnailUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWFul4wWrovO6LIbImiVNfovHIUc_jMcoU8A&usqp=CAU",
    region: "서울특별시 강남구",
    manager: ShelterManagerProfile(name: "매니저"),
    desc: "",
  ),
  ShelterProfile(
    name: "보호소 이름2",
    numberOfDogs: 13,
    numberOfCats: 21,
    numberOfVolunteers: 13,
    thumbnailUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWFul4wWrovO6LIbImiVNfovHIUc_jMcoU8A&usqp=CAU",
    region: "서울특별시 강남구",
    manager: ShelterManagerProfile(name: "매니저"),
    desc: "",
  ),
  ShelterProfile(
    name: "보호소 이름3",
    numberOfDogs: 21,
    numberOfVolunteers: 31,
    thumbnailUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWFul4wWrovO6LIbImiVNfovHIUc_jMcoU8A&usqp=CAU",
    region: "서울특별시 강남구",
    manager: ShelterManagerProfile(name: "매니저"),
    desc: "",
  ),
];

final mockSheltersInfo = SheltersInfo(
  "전체",
  mockShelters.length,
  200,
  23,
  100,
  mockShelters,
);
