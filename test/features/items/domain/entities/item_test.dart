import 'package:integrador_mobile/features/items/domain/entities/exceptions.dart';
import 'package:integrador_mobile/features/items/domain/entities/item.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test/test.dart';

void main(){
  late Item anItem;
  final aPerson = Person('pepito');

  setUp(() async {
    await initializeDateFormatting('es_AR');
    anItem = Item();
  });

  test('An item starts with no reservations', () {
    expect(anItem.isReserved(), false);
    expect(anItem.numberOfReservations, 0);
  });
  test('An item can be reserved by a person', () {
    anItem.reserve(aPerson);
    expect(anItem.isReserved(), true);
    // expect(item.reservedBy, person);
    expect(anItem.numberOfReservations, 1);
  });
  test('An item reserved can be returned', () {
    anItem.reserve(aPerson);
    anItem.returnToStore();
    expect(anItem.isReserved(), false);
  });
  test('An item that is not reserved cannot be returned', () {
    expect(() => anItem.returnToStore(),throwsA(CantReturnAvailableItemException));
  });
  test('An item that is reserved cannot be reserved again', (){
    anItem.reserve(aPerson);
    expect(() => anItem.reserve(aPerson),throwsA(CantReserveAlreadyReservedItemException));
    expect(anItem.numberOfReservations, 1);
  });
  group('regarding item description', (){
    test('A book description is its title and author', () {
      final aBook = Book('title', 'author');
      expect(aBook.description(), '"title", author');
    });
    test('A movie description is its title and duration', (){
      final aMovie = Movie(title: 'El piola', duration: 150);
      expect(aMovie.description(), '"El piola", 150');
    });
    test('A magazine description is its name, number and publication date', (){
      final aMagazine = Magazine(name: 'magazine', number: 2, publicationDate: DateTime(1999, 8, 9));
      expect(aMagazine.description(), '"magazine", numero 2, agosto 1999');
    });
  });

}
