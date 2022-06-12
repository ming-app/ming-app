import 'package:ming/shelters/model/shelters_info.dart';
import 'package:ming_api/ming_api.dart';

final mockShelters = [
  Shelter(
    id: 0,
    name: "보호소 이름1",
    numberOfCats: 3,
    numberOfDogs: 20,
    numberOfVolunteers: 4,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWFul4wWrovO6LIbImiVNfovHIUc_jMcoU8A&usqp=CAU",
  ),
  Shelter(
    id: 1,
    name: "보호소 이름2",
    numberOfDogs: 13,
    numberOfCats: 21,
    numberOfVolunteers: 13,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWFul4wWrovO6LIbImiVNfovHIUc_jMcoU8A&usqp=CAU",
  ),
  Shelter(
    id: 2,
    name: "보호소 이름3",
    numberOfDogs: 21,
    numberOfVolunteers: 31,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWFul4wWrovO6LIbImiVNfovHIUc_jMcoU8A&usqp=CAU",
  ),
  Shelter(id: 3, name: "보호소 이름4"),
];

final mockSheltersInfo = SheltersInfo(
  "전체",
  mockShelters.length,
  200,
  23,
  100,
  mockShelters,
);
