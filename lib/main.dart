import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:valet/models/parking_model.dart';
import 'firebase_options.dart';
import 'bookings.dart';
import 'parking_details.dart';
import 'widgets/searchbar.dart';
import 'widgets/search_tile.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valet',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Valet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    firebaseInit();
  }

  firebaseInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const HOME()));
          },
          child: const Text("Go to home"),
        )));
  }
}

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  List itemsJson = [];
  List<ParkingDetailsModel> _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);

    setState(() {
      itemsJson = data["items"];
      _items = List<ParkingDetailsModel>.from(
          itemsJson.map((model) => ParkingDetailsModel.fromJson(model)));
    });
  }

  void filterSearch(query) {
    var filteredList = itemsJson.where(
      (element) => element.name.contains(query),
    ).toList();
    setState(() {
      itemsJson = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        actions: [
          IconButton(
              onPressed: () {
                analytics.logEvent(name: "LoginPressed", parameters: {
                  'name': 'Riri',
                  'number': 7,
                });
              },
              icon: const Icon(Icons.login))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text('Valet Menu'),
            ),
            ListTile(
              title: const Text('My bookings'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BOOKINGS()));
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 0.0),
        child: Column(
          children: [
            SearchBar(),
            ElevatedButton(
                onPressed: () => readJson(),
                child: const Text('Look around me')),
            ElevatedButton(
                onPressed: () => filterSearch('Parkings'),
                child: const Text('Filter')),
            Expanded(
                child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    PARKING_DETAILS(details: _items[index]))),
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(top: 20.0),
                          child: SearchTile(
                            title: _items[index].name,
                            times: _items[index].times,
                            imageUrl: _items[index].imageUrl,
                            fares: _items[index].fares,
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
