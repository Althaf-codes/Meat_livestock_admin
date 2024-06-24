import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> sampleSearch = ['Cat', 'Dog', 'Cow', 'Meat', 'medicine'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear, color: Colors.black))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> suggestions = sampleSearch.where((value) {
      final result = value.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: sampleSearch.length,
      itemBuilder: (context, index) {
        final suggestion = sampleSearch[index];
        return ListTile(
          title: Text(suggestion),
        );
      },
    );
  }
}
