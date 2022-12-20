import 'package:flutter/material.dart';
import 'package:valet/models/parking_model.dart';

class PARKING_DETAILS extends StatefulWidget {
  const PARKING_DETAILS({super.key, required this.details});
  final ParkingDetailsModel details;

  @override
  State<PARKING_DETAILS> createState() => _PARKING_DETAILSState();
}

class _PARKING_DETAILSState extends State<PARKING_DETAILS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Parking information"),
          leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: const Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: Column(
          children: [
          Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(widget.details.name, style: const TextStyle(
              fontSize: 24,
            )),
          ),
          Image.network(widget.details.imageUrl),
          Text(widget.details.fares),
          Text(widget.details.times),
        ]),
      ),
    );
  }
}
