import '../../domain/entities/item.dart';

const URL = 'http://localhost:9001';

class RemoteDataSource {
  Future<List<Item>> fetchItems() async {
    return [];
  }
}