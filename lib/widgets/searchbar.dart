import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

typedef SearchCallback = void Function(String query);

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.onSearchChanged});
  final SearchCallback onSearchChanged;

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsetsDirectional.all(20),
          child: TextField(
            onChanged: (value) => onSearchChanged(value.toLowerCase()),
            decoration: InputDecoration(
              hintText: tr!.searchHint,
              suffixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
