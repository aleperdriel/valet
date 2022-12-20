import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({super.key});

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsetsDirectional.all(10),
            child: ListTile(
                leading: const Icon(Icons.bookmark_added),
                title: Text("Skill $index")),
          );
        });
  }
}
