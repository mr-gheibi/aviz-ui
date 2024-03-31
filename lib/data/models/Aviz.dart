class Aviz {
  String name;
  String description;
  String photoAddress;
  int price;
  int pricePerMeter;
  int meterage;
  int rooms;
  String floors;
  int buildYear;
  String location;
  double lat;
  double long;
  String sanad;
  String direction;
  List<String> features;
  String moreInfo;
  String city;

  Aviz({
    required this.name,
    required this.description,
    required this.photoAddress,
    required this.price,
    required this.pricePerMeter,
    required this.meterage,
    required this.rooms,
    required this.floors,
    required this.buildYear,
    required this.location,
    required this.lat,
    required this.long,
    required this.sanad,
    required this.direction,
    required this.features,
    required this.moreInfo,
    required this.city,
  });
}
