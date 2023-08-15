import 'package:flutter/material.dart';
import 'package:integrador_mobile/features/items/data/repositories/item_repository_impl.dart';

import '../../domain/entities/item.dart';
import '../widgets/ItemContent.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final List<Item> items = ItemRepositoryImpl().getItems();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text(title, style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 5.0),
          child: ListView.separated(
            separatorBuilder: (_,__) => const Divider(thickness: 1.0,),
            itemBuilder: _buildItems,
            itemCount: items.length,
          ),
        ),
      ),
    );
  }

  Widget? _buildItems(BuildContext context, int index) {
    return ItemContent(item: items[index]);
  }
}
