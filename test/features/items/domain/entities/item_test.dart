
import 'dart:math';

import 'package:integrador_mobile/features/items/domain/entities/exceptions.dart';
import 'package:integrador_mobile/features/items/domain/entities/item.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:test/test.dart';

void main(){
  late Item item;
  final person = Person('pepito');

  setUp(() {
    item = Item();
  });

  test('An item starts with no reservations', () {
    expect(Item().isReserved(), false);
    expect(Item().numberOfReservations, 0);
  });
  test('An item can be reserved by a person', () {
    item.reserve(person);
    expect(item.isReserved(), true);
    // expect(item.reservedBy, person);
    expect(item.numberOfReservations, 1);
  });
  test('An item reserved can be returned', () {
    item.reserve(person);
    item.returnToStore();
    expect(item.isReserved(), false);
  });
  test('An item that is not reserved cannot be returned', () {
    expect(() => item.returnToStore(),throwsA(CantReturnAvailableItemException));
  });

}
