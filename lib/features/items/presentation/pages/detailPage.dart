import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.item});

  final String title;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text('TITULO')),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Volver'),),
      ),
    );
  }
}