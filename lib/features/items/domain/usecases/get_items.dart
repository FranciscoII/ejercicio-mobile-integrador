import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';

import '../entities/item.dart';

class GetItems {
  final ItemRepository repository;

  GetItems(this.repository);

  Future<List<Item>> call() async {
    return await repository.getItems();
  }
}