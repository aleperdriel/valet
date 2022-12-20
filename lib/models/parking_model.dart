class ParkingDetailsModel {
  String id='0';
  String name='Parking null';
  String fares='fares null';
  String times='times null';
  String imageUrl='image null';
  
  ParkingDetailsModel({required this.id, required this.name, required this.fares, required this.times, required this.imageUrl});

  ParkingDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fares = json['fares'];
    times = json['times'];
    imageUrl = json['imageUrl'];

  }
}