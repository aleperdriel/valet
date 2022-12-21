import 'package:flutter/material.dart';
import 'package:valet/screens/bookings.dart';
import 'package:animated_check/animated_check.dart';

class ConfirmedPayment extends StatefulWidget {
  const ConfirmedPayment({super.key, required this.slot});
  final String slot;

  @override
  State<ConfirmedPayment> createState() => _ConfirmedPaymentState();
}

class _ConfirmedPaymentState extends State<ConfirmedPayment>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));

    _animationController.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: const Text('Thank you !',
                          style: TextStyle(fontSize: 24))),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            color: Colors.deepPurple[100],
                            child: Column(
                              children: [
                                const Text(
                                  "Booking confirmed !",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 22, 13, 61)),
                                ),
                                Row(children: [
                                  AnimatedCheck(
                                    progress: _animation,
                                    size: 100,
                                  ),
                                  Expanded(
                                    child: Text(
                                        'You have 10 minutes to park your car to the slot ${widget.slot}'),
                                  )
                                ]),
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            color: Colors.deepPurple[50],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 39, 26, 93))),
                                    onPressed: () => {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BOOKINGS())),
                                        },
                                    child: const Text(
                                      'See your bookings',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 13, 61)),
                                    )),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
