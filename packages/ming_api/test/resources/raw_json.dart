const authResponseValid = """
{
  "result": {
    "accessToken": "string",
    "expiresIn": 0,
    "refreshToken": "string",
    "refreshTokenExpiresIn": 0,
    "tokenType": "string"
  },
  "resultCode": "string",
  "resultMessage": "string"
}
""";

const homeShelterOverviewValid = """
{
  "result": [
    {
      "adoptedAnimalCount": 0,
      "animalInShelterCount": 0,
      "count": 0,
      "region": {
        "fullName": "string",
        "id": "string",
        "name": "string"
      },
      "volunteerOverview": {
        "count": 0,
        "thumbnailUrl": [
          "string"
        ]
      }
    }
  ],
  "resultCode": "string",
  "resultMessage": "string"
}
""";

const shelterReviewResponseValid = """
{
  "result": {
    "content": [
      {
        "comment": "string",
        "date": "2022-07-30T16:48:02.374Z",
        "id": "string",
        "volunteerOverview": {
          "count": 0,
          "thumbnailUrl": [
            "string"
          ]
        },
        "writer": {
          "id": "string",
          "name": "string",
          "thumbnailUrl": "string"
        }
      }
    ],
    "empty": true,
    "first": true,
    "last": true,
    "number": 0,
    "numberOfElements": 0,
    "pageable": {
      "offset": 0,
      "pageNumber": 0,
      "pageSize": 0,
      "paged": true,
      "sort": {
        "empty": true,
        "sorted": true,
        "unsorted": true
      },
      "unpaged": true
    },
    "size": 0,
    "sort": {
      "empty": true,
      "sorted": true,
      "unsorted": true
    },
    "totalElements": 0,
    "totalPages": 0
  },
  "resultCode": "string",
  "resultMessage": "string"
}
""";
