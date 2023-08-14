import '../entities/item.dart';

abstract class ItemRepository{
  List<Item> getItems();
}