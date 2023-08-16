import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrador_mobile/features/items/data/repositories/item_repository_impl.dart';
import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';
import 'package:integrador_mobile/features/items/presentation/cubit/item_list_cubit.dart';

import '../../domain/entities/item.dart';
import '../widgets/ItemContent.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final items = ItemRepositoryImpl().itemList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text(title, style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: BlocProvider(
        create: (_) => ItemListCubit(
            [],repository: context.read<ItemRepository>()
        )..fetchItems(),
        child: const HomepageContent()
      ),
    );
  }
}

class HomepageContent extends StatelessWidget{
  const HomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListCubit>().state;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, top: 5.0),
        child: ListView.separated(
          separatorBuilder: (_,__) => const Divider(thickness: 1.0,),
          itemBuilder: (context, index) => _buildItems(context, index, items),
          itemCount: items.length,
        ),
      ),
    );
  }

  Widget? _buildItems(BuildContext context, int index, List<Item> items) {
    return ItemContent(item: items[index]);
  }

}