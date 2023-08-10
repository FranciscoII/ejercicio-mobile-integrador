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
    anItem = Book(title: 'title', author: 'author', numberOfPages: 100);
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
      final aBook = Book(title: 'title', author: 'author', numberOfPages: 100);
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
  group('regarding item devolution date', () {
    test('An item that is available does not have an returnDate', () {
      final aBook = Book(title: 'title', author: 'author', numberOfPages: 103);
      
      expect(aBook.returnDate(), null);
    });
    test('A book devolution time is 1 day per 100 pages rounded up', () {
      final aBook = Book(title: 'title', author: 'author', numberOfPages: 103);
      aBook.reserve(aPerson);

      expectItemReturnDateIsAfterXDays(aBook, 2);
    });

    test('A movie devolution time is 5 days when the movie lasts 2 or more hours', () {
      final aMovieThatLastsMoreThanTwoHours = Movie(title: 'title', duration: 300);
      aMovieThatLastsMoreThanTwoHours.reserve(aPerson);

      expectItemReturnDateIsAfterXDays(aMovieThatLastsMoreThanTwoHours, 5);
    });
    test('A movie devolution time is 3 days when it lasts less than 2 hours', () {
      final aMovieThatLastLessThanTwoHours = Movie(title: 'title', duration: 60);
      aMovieThatLastLessThanTwoHours.reserve(aPerson);

      expectItemReturnDateIsAfterXDays(aMovieThatLastLessThanTwoHours, 3);
    });
    test('A magazine devolution time is 2 days when it was published before 1980', (){
      final aMagazinePublishedBefore1980 = Magazine(name: 'name', number: 1, publicationDate: DateTime(1940));
      aMagazinePublishedBefore1980.reserve(aPerson);

      expectItemReturnDateIsAfterXDays(aMagazinePublishedBefore1980, 2);
    });
    test('A magazine devolution time is 3 days when it was published between 1980 and 2000', (){
      final aMagazinePublishedBetween1980and2000 = Magazine(name: 'name', number: 1, publicationDate: DateTime(1990));
      aMagazinePublishedBetween1980and2000.reserve(aPerson);

      expectItemReturnDateIsAfterXDays(aMagazinePublishedBetween1980and2000, 3);
    });
    test('A magazine devolution time is 5 days when it was published after 2000', (){
      final aMagazinePublishedAfter2000 = Magazine(name: 'name', number: 1, publicationDate: DateTime(2100));
      aMagazinePublishedAfter2000.reserve(aPerson);

      expectItemReturnDateIsAfterXDays(aMagazinePublishedAfter2000, 5);
    });
  });

}
void expectItemReturnDateIsAfterXDays(Item item, int days){
  final expectedDate = DateTime.now().add(Duration(days: days));
  //Esto no me convence pero no quiero detenerme en detalles
  expect(item.returnDate()!.day, expectedDate.day);
  expect(item.returnDate()!.month, expectedDate.month);
  expect(item.returnDate()!.year, expectedDate.year);
}
