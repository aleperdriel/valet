import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ContactsTab extends StatefulWidget {
  const ContactsTab({super.key});

  @override
  State<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.person),
              trailing: const Text(
                "CHAT",
                style: TextStyle(color: Colors.blueAccent, fontSize: 14),
              ),
              title: Text("Contact $index"));
        });
  }
}
