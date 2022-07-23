final shelterPhotosMock = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6jhhs9GGC2CNFv6kwjmjtog8FX2DHIkhnNQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFd95Y9Uy8xw6WYdyvi1wwerujC2egOM-xqw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6jhhs9GGC2CNFv6kwjmjtog8FX2DHIkhnNQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFd95Y9Uy8xw6WYdyvi1wwerujC2egOM-xqw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6jhhs9GGC2CNFv6kwjmjtog8FX2DHIkhnNQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFd95Y9Uy8xw6WYdyvi1wwerujC2egOM-xqw&usqp=CAU",
];

List<String> mockFetchImages(int current) {
  if (current > 30) {
    return [];
  } else {
    return shelterPhotosMock;
  }
}
