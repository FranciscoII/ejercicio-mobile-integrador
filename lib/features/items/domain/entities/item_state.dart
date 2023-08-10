import 'exceptions.dart';
import 'item.dart';
import 'person.dart';

abstract class ItemState {
  void returnToStore(Item item);

  void reserve(Item item, Person person);

  bool isReserved();

  DateTime? returnDate();
}

class AvailableState implements ItemState {
  @override
  void returnToStore(_) => throw CantReturnAvailableItemException;

  @override
  void reserve(Item item, Person person) {
    item.changeState(ReservedState(
        expectedReturnDate: DateTime.now().add(item.numberOfDaysToReturn()))
    );
  }

  @override
  bool isReserved() => false;

  @override
  DateTime? returnDate() => null;
}

class ReservedState implements ItemState {
  DateTime expectedReturnDate;

  ReservedState({required this.expectedReturnDate});

  @override
  void returnToStore(Item item) {
    item.changeState(AvailableState());
  }

  @override
  bool isReserved() => true;

  @override
  void reserve(_, __) => throw CantReserveAlreadyReservedItemException;

  @override
  DateTime? returnDate() {
    return expectedReturnDate;
  }
}
