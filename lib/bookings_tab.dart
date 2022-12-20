import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class BookingsTab extends StatefulWidget {
  const BookingsTab({super.key});

  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('My bookings')
    );
  }
}