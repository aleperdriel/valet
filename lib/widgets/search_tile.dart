import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key, required this.title, required this.times, required this.fares, this.distance, required this.imageUrl});
  final String title;
  final String times;
  final String fares;
  final String? distance;

  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(title),
        subtitle: Text(times),
        dense: false,
        isThreeLine: true,
      ),
    );
  }
}