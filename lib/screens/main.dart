import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:valet/models/parking_model.dart';
import '../firebase_options.dart';
import 'bookings.dart';
import 'parking_details.dart';
import '../widgets/searchbar.dart';
import '../widgets/search_tile.dart';
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      home: const HOME(),
    );
  }
}

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference parkingRef =
      FirebaseFirestore.instance.collection('parkings');

  List itemsJson = [];
  List<ParkingDetailsModel> _items = [];
  List<ParkingDetailsModel> _displayedItems = [];

  @override
  initState() {
    super.initState();
    readJson();
    // fetchData().then((List data) {
    //   setState(() {
    //     itemsJson = data;
    //     _items = List<ParkingDetailsModel>.from(
    //         itemsJson.map((model) => ParkingDetailsModel.fromJson(model)));
    //     _displayedItems = _items;
    //   });
    // });
  }

  // Future<List> fetchData() async {
  //   List parkingsList = [];
  //   final parkingRef = FirebaseFirestore.instance
  //       .collection('parkings')
  //       .withConverter<ParkingDetailsModel>(
  //         fromFirestore: (snapshot, _) =>
  //             ParkingDetailsModel.fromJson(snapshot.data()!),
  //         toFirestore: (parking, _) => ParkingDetailsModel.toJson(),
  //       );
  //   return parkingsList;
  // }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);

    setState(() {
      itemsJson = data["items"];
      _items = List<ParkingDetailsModel>.from(
          itemsJson.map((model) => ParkingDetailsModel.fromJson(model)));
      _displayedItems = _items;
    });
  }

  void filterSearch(String query) {
    var filteredList = _items
        .where(
          (element) => element.name.toLowerCase().contains(query),
        )
        .toList();
    setState(() {
      _displayedItems = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Valet"),
        // actions: [
        // IconButton(
        //     onPressed: () {
        //       analytics.logEvent(name: "LoginPressed", parameters: {
        //         'name': 'Riri',
        //         'number': 7,
        //       });
        //     },
        //     icon: const Icon(Icons.login))
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ListTile(
                title: Text(tr!.bookingsTitle),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BOOKINGS()));
                },
              ),
            ),
            ListTile(
              title: Text(tr.helpTitle),
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
            SearchBar(
              onSearchChanged: (query) => {filterSearch(query)},
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurple)),
                onPressed: () => readJson(),
                child: Text(tr.aroundMe)),
            Expanded(
                child: ListView.builder(
                    itemCount: _displayedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ParkingDetails(
                                    details: _displayedItems[index]))),
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(top: 20.0),
                          child: SearchTile(
                            title: _displayedItems[index].name,
                            times: _displayedItems[index].times,
                            imageUrl: _displayedItems[index].imageUrl,
                            fares: _displayedItems[index].fares,
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
