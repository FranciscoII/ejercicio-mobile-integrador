/*
import 'package:integrador_mobile/features/items/data/datasources/remote_data_source.dart';
import 'package:integrador_mobile/features/items/data/repositories/item_repository_impl.dart';
import 'package:integrador_mobile/features/items/domain/entities/item.dart';
import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Mock classes
class MockRemoteDataSource extends Mock implements RemoteDataSource {}


void main(){
  final mockResponse = [Book(title: 'title', author: 'author', numberOfPages: 200)];
  late ItemRepository itemRepository;
  late RemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    itemRepository = ItemRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });
  test('delegates the fetch of the items to the datasource', (){
    setUp(() {
      // when(mockRemoteDataSource.fetchItems).thenAnswer((_) async => mockResponse);
    });
  });
}

 */