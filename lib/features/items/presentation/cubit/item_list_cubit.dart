import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class ItemListCubit extends Cubit<ItemListState> {
  final ItemRepository repository;

  ItemListCubit(List<Item> listItem, {required this.repository})
      : super(const ItemListState.loading());

  Future<void> fetchItems() async {
    try{
      final items = await repository.getItems();
      emit(ItemListState.success(items));
    } on Exception {
      emit(const ItemListState.failure());
    }
  }
}

enum ListStatus { loading, success, failure }

class ItemListState {
  final ListStatus status;
  final List<Item> items;

  const ItemListState._({
    this.status = ListStatus.loading,
    this.items = const [],
  });

  const ItemListState.loading() : this._();

  const ItemListState.success(List<Item> items)
      : this._(status: ListStatus.success, items: items);

  const ItemListState.failure() : this._(status: ListStatus.failure);
}
