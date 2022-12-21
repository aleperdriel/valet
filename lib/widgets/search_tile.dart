import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile(
      {super.key,
      required this.title,
      required this.times,
      required this.fares,
      this.distance,
      required this.imageUrl});
  final String title;
  final String times;
  final String fares;
  final String? distance;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      color: Colors.grey[200],
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          imageUrl,
          width: 100,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(times),
                Text("$fares€"),
                Text(distance ?? "0 m",
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
