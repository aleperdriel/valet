import 'package:flutter/material.dart';
import 'package:valet/models/parking_model.dart';
import 'package:valet/models/booking_info_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'confirmed_payment.dart';

class Payment extends StatefulWidget {
  const Payment(
      {super.key, required this.parkingDetails, required this.bookingInfo});
  final ParkingDetailsModel parkingDetails;
  final BookingInfoModel bookingInfo;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _plateController = TextEditingController();
  final _modelController = TextEditingController();
  final _numberController = TextEditingController();
  final _holderController = TextEditingController();
  final _expirationController = TextEditingController();
  final _codeController = TextEditingController();

  bool isValid() {
    if (_plateController.text.isEmpty ||
        _modelController.text.isEmpty ||
        _numberController.text.isEmpty ||
        _holderController.text.isEmpty ||
        _expirationController.text.isEmpty ||
        _codeController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void _submit() {
    debugPrint(isValid().toString());
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ConfirmedPayment(slot: widget.bookingInfo.slot)));
  }

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            textAlign: TextAlign.center,
            tr!.paymentTitle,
            style: const TextStyle(color: Colors.black, fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.black)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Column(
                    children: [
                      Text(widget.parkingDetails.name,
                          style: const TextStyle(
                            fontFamily: "Nunito Sans",
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          )),
                      Text("Slot ${widget.bookingInfo.slot}",
                          style: const TextStyle(
                            // fontFamily: "Nunito Sans",
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    color: const Color.fromARGB(255, 199, 199, 199),
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(widget.bookingInfo.duration,
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 16, width: double.infinity),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, top: 5),
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Material(
                            child: ListTile(
                              tileColor:
                                  const Color.fromARGB(255, 239, 239, 239),
                              leading: const Text("From",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              trailing: Text(widget.bookingInfo.startTime,
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, top: 10),
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Material(
                            child: ListTile(
                              tileColor:
                                  const Color.fromARGB(255, 239, 239, 239),
                              leading: const Text("To",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              trailing: Text(widget.bookingInfo.endTime,
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 18, 35, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Fees"),
                              Text("7€"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 35, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Advanced booking"),
                              Text("1€"),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          color: Colors.grey[700],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(widget.bookingInfo.price,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(tr.aboutVehicle,
                              style: const TextStyle(fontSize: 26))),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (_) => setState(() {}),
                              controller: _plateController,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: tr.carPlate,
                                filled: true,
                                contentPadding: const EdgeInsets.all(15),
                                border: InputBorder.none,
                                fillColor:
                                    const Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              onChanged: (_) => setState(() {}),
                              controller: _modelController,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: tr.carModel,
                                filled: true,
                                contentPadding: const EdgeInsets.all(15),
                                border: InputBorder.none,
                                fillColor:
                                    const Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(tr.payment,
                              style: const TextStyle(fontSize: 26))),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (_) => setState(() {}),
                              controller: _numberController,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: tr.cardNumber,
                                filled: true,
                                contentPadding: const EdgeInsets.all(15),
                                border: InputBorder.none,
                                fillColor:
                                    const Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              onChanged: (_) => setState(() {}),
                              controller: _holderController,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: tr.cardHolder,
                                filled: true,
                                contentPadding: const EdgeInsets.all(15),
                                border: InputBorder.none,
                                fillColor:
                                    const Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (_) => setState(() {}),
                                    controller: _expirationController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      hintText: tr.cardDate,
                                      filled: true,
                                      contentPadding: const EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      fillColor: const Color.fromARGB(
                                          255, 215, 215, 215),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: TextField(
                                    onChanged: (_) => setState(() {}),
                                    controller: _codeController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      hintText: tr.cardCode,
                                      filled: true,
                                      contentPadding: const EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      fillColor: const Color.fromARGB(
                                          255, 215, 215, 215),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: isValid() ? _submit : null,
                      child: const Text("PAY AND BOOK",
                          style: TextStyle(fontSize: 20))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
