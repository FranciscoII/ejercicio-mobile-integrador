import 'package:integrador_mobile/features/items/domain/entities/exceptions.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';

class Item {

  Item(){
    state = AvailableState(this);
    numberOfReservations = 0;
  }

  late ItemState state;
  late int numberOfReservations;

  isReserved() => state is ReservedState;

  void reserve(Person person) {
    state.reserve(person);
    numberOfReservations += 1;
  }

  void returnToStore() {
    state.returnToStore();
  }

  void changeState(ItemState state) {
    this.state = state;
  }

}
abstract class ItemState {
  late final Item item;
  void returnToStore();
  void reserve(Person person);
}

class AvailableState implements ItemState{
  @override
  Item item;

  AvailableState(this.item);

  @override
  void returnToStore() => throw CantReturnAvailableItemException;

  @override
  void reserve(Person person) {
    item.changeState(ReservedState(item));
  }
}
class ReservedState implements ItemState{
  @override
  Item item;

  ReservedState(this.item);

  @override
  void returnToStore() {
    item.changeState(AvailableState(item));
  }

  @override
  void reserve(Person person) {

  }
}