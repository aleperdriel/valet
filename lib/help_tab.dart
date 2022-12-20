import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class HelpTab extends StatefulWidget {
  const HelpTab({super.key});

  @override
  State<HelpTab> createState() => _HelpTabState();
}

class _HelpTabState extends State<HelpTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Need some help ?')
      ],
    );
        
  }
}
