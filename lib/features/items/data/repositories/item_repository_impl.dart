import 'package:integrador_mobile/features/items/domain/entities/item.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository{
  ItemRepositoryImpl();

  final List<Item> itemList = [
    Book(title: '1984', author: 'George Orwell', numberOfPages: 203),
    Movie(title: 'Fight Club', duration: 144, reservedBy: Person('Francisco Cortez'), returnDate: DateTime.now().add(Duration(days: 2))),
    Movie(title: 'Fight Club', duration: 144),
    Movie(title: 'Fight Club', duration: 144),
    Movie(title: 'Fight Club', duration: 144),
    Movie(title: 'Fight Club', duration: 144),
    Movie(title: 'Fight Club', duration: 144),
    Movie(title: 'Fight Club', duration: 144),
    Movie(title: 'Fight Club', duration: 144),
    Magazine(name: 'Superman', number: 4, publicationDate: DateTime.now()),
  ];

  @override
  Future<List<Item>> getItems() {
    return Future.delayed(const Duration(milliseconds: 100), () => itemList);
  }
}