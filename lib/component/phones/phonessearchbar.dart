import 'package:flutter/material.dart';

class PhonesSearchBar extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // button retour du search
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("je suis le resultat");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("je suis les suggestions");
  }
}
