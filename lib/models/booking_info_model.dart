class BookingInfoModel {
  String id = '0';
  String slot = '#000';
  String price = '0';
  String startTime = '0:00';
  String endTime = '23:59';
  String duration = '23h59min';

  BookingInfoModel({
    required this.id,
    required this.slot,
    required this.price,
    required this.startTime,
    required this.endTime,
    required this.duration,
  });

  BookingInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slot = json['slot'];
    price = json['price'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = json['duration'];
  }

  void setSlot(String newSlot) {
    slot = newSlot;
  }
}
