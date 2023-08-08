import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text(title)),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Volver'),),
      ),
    );
  }
}