import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'features/filter_provider.dart';

class FilterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available:'),
            FilterChip(
              label: Text('Available'),
              selected: true, // This state needs to be handled
              onSelected: (isSelected) {
                // Handle the selection of 'Available' filter
              },
            ),
            Text('Gender:'),
            Wrap(
              spacing: 8.0,
              children: [
                FilterChip(
                  label: Text('Male'),
                  selected: true, // This state needs to be handled
                  onSelected: (isSelected) {
                    // Handle the selection of 'Male' filter
                  },
                ),
                FilterChip(
                  label: Text('Female'),
                  selected: true, // This state needs to be handled
                  onSelected: (isSelected) {
                    // Handle the selection of 'Female' filter
                  },
                ),
              ],
            ),
            Text('Domain:'),
            Wrap(
              spacing: 8.0,
              children: [
                FilterChip(
                  label: Text('Sales'),
                  selected: true, // This state needs to be handled
                  onSelected: (isSelected) {
                    // Handle the selection of 'Sales' filter
                  },
                ),
                FilterChip(
                  label: Text('IT'),
                  selected: true, // This state needs to be handled
                  onSelected: (isSelected) {
                    // Handle the selection of 'IT' filter
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      /* Your UI to select filter options */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Apply filters and close the filter page
          Navigator.of(context).pop();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
