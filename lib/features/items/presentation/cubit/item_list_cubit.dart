import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class ItemListCubit extends Cubit<List<Item>> {
  final ItemRepository repository;
  ItemListCubit(List<Item> listItem, {required this.repository}) : super(listItem);

  Future<void> fetchItems() async {
    final items = await repository.getItems();
    emit(items);
  }
}