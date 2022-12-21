import 'package:flutter/material.dart';
import 'package:valet/models/booking_info_model.dart';
import 'package:valet/models/parking_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'choose_spot.dart';

class ParkingDetails extends StatefulWidget {
  const ParkingDetails({super.key, required this.details});
  final ParkingDetailsModel details;

  @override
  State<ParkingDetails> createState() => _ParkingDetailsState();
}

class _ParkingDetailsState extends State<ParkingDetails> {
  @override
  void initState() {
    super.initState();
  }

  // final bookingInfo = {
  //   "selectedTime": "3",
  // };
  final bookingInfoJson = {
    "bookings": [
      {
        "id": "0",
        "slot": "",
        "price": "7€",
        "startTime": "11:35",
        "endTime": "12:35",
        "duration": ""
      }
    ]
  };

  void sendBookingInfo() {
    final data = bookingInfoJson['bookings'];
    final bookingInfo = BookingInfoModel.fromJson(data![0]);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChooseSpot(
            bookingInfo: bookingInfo, parkingDetails: widget.details)));
  }

  void updateDuration(value) {
    setState(() {
      bookingInfoJson["bookings"]![0]["duration"] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            textAlign: TextAlign.center,
            tr!.parkingDetailsTitle,
            style: const TextStyle(color: Colors.black, fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Column(
                children: [
                  Text(widget.details.name,
                      style: const TextStyle(
                        fontFamily: "Nunito Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      )),
                  Text(widget.details.type,
                      style: const TextStyle(
                        // fontFamily: "Nunito Sans",
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(widget.details.imageUrl)),
            // Text(widget.details.fares),
            // Text(widget.details.times),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.details.address,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      widget.details.distance ?? '0',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.deepPurple[100],
                  padding: const EdgeInsetsDirectional.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(tr.bookSectionTitle,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 16, width: double.infinity),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Material(
                          child: ListTile(
                            onTap: () => {updateDuration("1h")},
                            tileColor: const Color.fromARGB(255, 239, 239, 239),
                            leading: const Text("1 hour",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            trailing: const Text("3€",
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Material(
                          child: ListTile(
                            onTap: () => {updateDuration("3h")},
                            tileColor: const Color.fromARGB(255, 239, 239, 239),
                            leading: const Text("3 hours",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            trailing: const Text("6€",
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        child: const Material(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Other...",
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              fillColor: Color.fromARGB(255, 239, 239, 239),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () => {
                              sendBookingInfo(),
                            },
                            style: const ButtonStyle(),
                            child: Text(tr.bookButton),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(tr.timesSectionTitle,
                          style: const TextStyle(fontSize: 24))),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(widget.details.times))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Contact", style: TextStyle(fontSize: 24))),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(widget.details.phoneNumber))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
