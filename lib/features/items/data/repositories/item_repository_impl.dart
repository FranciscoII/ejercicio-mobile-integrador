import 'package:integrador_mobile/features/items/domain/entities/item.dart';
import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository{

  final List<Item> itemList = [
    Book(title: '1984', author: 'George Orwell', numberOfPages: 203),
    Movie(title: 'Fight Club', duration: 144),
    Magazine(name: 'La muerte de Superman', number: 4, publicationDate: DateTime.now()),
  ];

  @override
  List<Item> getItems() {
    return itemList;
  }
}