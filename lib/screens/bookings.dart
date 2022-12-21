import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BOOKINGS extends StatefulWidget {
  const BOOKINGS({super.key});

  @override
  State<BOOKINGS> createState() => _BOOKINGSState();
}

class _BOOKINGSState extends State<BOOKINGS> {
  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            textAlign: TextAlign.center,
            tr!.bookingsTitle,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: ListTile(
                  title: Text(tr.searchTitle),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const HOME()));
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
                indent: 10,
                endIndent: 20,
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
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: [
                      const Image(image: AssetImage("assets/images/car2.png")),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ACTIVE",
                                style: TextStyle(fontWeight: FontWeight.w900)),
                            Text('Parking 1'),
                            Text('10 min left')
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(45, 25, 45, 25),
                  color: Colors.deepPurple[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 32, 25, 62))),
                            onPressed: () => {},
                            child: const Text(
                              'Add time',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 32, 25, 62)),
                            )),
                      ),
                      const Spacer(),
                      Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 32, 25, 62))),
                            onPressed: () => {},
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 22, 13, 61)),
                            )),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("History", style: TextStyle(fontSize: 26))),
              ),
              Expanded(
                child: Material(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsetsDirectional.only(top: 15.0),
                            child: ListTile(
                              tileColor:
                                  const Color.fromARGB(255, 208, 208, 208),
                              leading: const Icon(Icons.warehouse),
                              title: Text("Parking $index"),
                              subtitle: const Text("12/07/2022"),
                              trailing: const Text("10€",
                                  style: TextStyle(fontSize: 16)),
                            ));
                      }),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple,
                  child: IconButton(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HOME()))
                          },
                      icon: const Icon(Icons.search),
                      style: IconButton.styleFrom(
                        shape: const CircleBorder(),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
