import 'package:flutter/material.dart';
import 'package:valet/screens/payment.dart';
import 'package:valet/models/parking_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:math' as math;

class ChooseSpot extends StatefulWidget {
  const ChooseSpot(
      {super.key, required this.bookingInfo, required this.parkingDetails});
  // final BookingInfoModel bookingInfo;
  final bookingInfo;

  final ParkingDetailsModel parkingDetails;

  @override
  State<ChooseSpot> createState() => _ChooseSpotState();
}

class _ChooseSpotState extends State<ChooseSpot> {
  @override
  void initState() {
    super.initState();
  }

  void updateSlot(value) {
    widget.bookingInfo.setSlot(value);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Payment(
            bookingInfo: widget.bookingInfo,
            parkingDetails: widget.parkingDetails)));
  }

  int floor = 0;
  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            textAlign: TextAlign.center,
            tr!.spotTitle,
            style: const TextStyle(color: Colors.black, fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            width: 200,
            child: TextField(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                filled: true,
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                floorRadioButton("-1", -1),
                floorRadioButton("0", 0),
                floorRadioButton("1", 1),
                floorRadioButton("2", 2),
                floorRadioButton("3", 3)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
            child: Row(
              children: [
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 15),
                        child: const Text(
                          "A",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        child: GestureDetector(
                            onTap: () => {updateSlot("#1A3")},
                            child: const Text("#1A3",
                                style: TextStyle(fontSize: 18))),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:
                            Image(image: AssetImage("assets/images/car.png")),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:
                            Image(image: AssetImage("assets/images/car.png")),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        child: GestureDetector(
                            onTap: () => {updateSlot("#1A6")},
                            child: const Text("#1A6",
                                style: TextStyle(fontSize: 18))),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 15),
                        child: const Text(
                          "B",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        child: GestureDetector(
                            onTap: () => {updateSlot("#1B3")},
                            child: const Text("#1B3",
                                style: TextStyle(fontSize: 18))),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Transform(
                          transform: Matrix4.rotationY(-2 * math.pi / 2),
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Image(
                                image: AssetImage("assets/images/car.png")),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Transform(
                          transform: Matrix4.rotationY(-2 * math.pi / 2),
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Image(
                                image: AssetImage("assets/images/car.png")),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Transform(
                          transform: Matrix4.rotationY(-2 * math.pi / 2),
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Image(
                                image: AssetImage("assets/images/car.png")),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget floorRadioButton(String text, int value) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          floor = value;
        });
      },
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(side: BorderSide(width: 10)),
        side: const BorderSide(color: Color.fromRGBO(179, 157, 219, 1)),
        backgroundColor: (floor == value)
            ? const Color.fromRGBO(179, 157, 219, 1)
            : Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: (floor == value) ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
