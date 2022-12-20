import 'package:flutter/material.dart';

class BOOKINGS extends StatefulWidget {
  const BOOKINGS({super.key});

  @override
  State<BOOKINGS> createState() => _BOOKINGSState();
}

class _BOOKINGSState extends State<BOOKINGS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookings")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('My bookings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BOOKINGS()));
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(children: [
        const Text('My bookings'),
      ]),
    );
  }
}