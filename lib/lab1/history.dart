import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Count History',
        ),
      ),
      body: ListView.builder(
        itemCount: historyCounts.length, // Use the historyCounts list
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Count: ${historyCounts[index]}'),
          );
        },
      ),
    );
  }
}

// List to store saved counts
List<int> historyCounts = [];
