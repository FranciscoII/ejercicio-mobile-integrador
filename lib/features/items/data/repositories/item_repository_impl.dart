import 'package:integrador_mobile/features/items/domain/entities/item.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository{
  ItemRepositoryImpl();

  final List<Item> itemList = [
    Book(title: '1984', author: 'George Orwell', numberOfPages: 203),
    Movie(title: 'Fight Club', duration: 144, reservedBy: Person('Francisco Cortez'), returnDate: DateTime.now().add(Duration(days: 2))),
    Movie(title: 'Fight Club', duration: 144),
    Magazine(name: 'Superman', number: 4, publicationDate: DateTime.now()),
    Movie(title: 'Amadeus', duration: 160),
    Movie(title: 'Rain Man', duration: 133),
    Movie(title: 'Dances with Wolves', duration: 181),
    Movie(title: 'Forrest Gump', duration: 142),
    Movie(title: 'Titanic', duration: 195),
  ];

  @override
  Future<List<Item>> getItems() {
    return Future.delayed(const Duration(milliseconds: 2000), () => itemList);
  }
}