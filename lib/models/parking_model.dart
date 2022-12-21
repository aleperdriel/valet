class ParkingDetailsModel {
  String id = '0';
  String name = 'Parking null';
  String fares = 'fares null';
  String times = 'times null';
  String imageUrl = 'image null';
  String address = 'Address unknown';
  String type = 'Type unknown';
  String phoneNumber = 'No number';
  String? distance = '0m';

  ParkingDetailsModel(
      {required this.id,
      required this.name,
      required this.fares,
      required this.times,
      required this.imageUrl,
      required this.address,
      required this.type,
      required this.phoneNumber,
      this.distance});

  ParkingDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fares = json['fares'];
    times = json['times'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    distance = json['distance'] ?? '0m';
  }
}
