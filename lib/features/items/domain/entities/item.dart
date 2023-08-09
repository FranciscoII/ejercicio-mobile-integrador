import 'package:integrador_mobile/features/items/domain/entities/exceptions.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:intl/intl.dart';


class Item {
  Item() {
    state = AvailableState();
    numberOfReservations = 0;
  }

  late ItemState state;
  late int numberOfReservations;

  isReserved() => state.isReserved();

  void reserve(Person person) {
    state.reserve(this, person);
    numberOfReservations += 1;
  }

  void returnToStore() {
    state.returnToStore(this);
  }

  void changeState(ItemState state) {
    this.state = state;
  }

  String description() {
    throw 'Must be implemented in subclasses';
  }
}

abstract class ItemState {
  void returnToStore(Item item);

  void reserve(Item item, Person person);

  bool isReserved();
}

class AvailableState implements ItemState {
  @override
  void returnToStore(_) => throw CantReturnAvailableItemException;

  @override
  void reserve(Item item, Person person) {
    item.changeState(ReservedState());
  }

  @override
  bool isReserved() => false;
}

class ReservedState implements ItemState {
  @override
  void returnToStore(Item item) {
    item.changeState(AvailableState());
  }

  @override
  bool isReserved() => true;

  @override
  void reserve(_, __) => throw CantReserveAlreadyReservedItemException;
}

class Book extends Item {
  final String title;
  final String author;

  Book(this.title, this.author);

  @override
  String description() {
    return '"$title", $author';
  }
}

class Movie extends Item {
  final String title;
  final int duration;

  Movie({
    required this.title,
    required this.duration,
  });

  @override
  String description() {
    return '"$title", $duration';
  }
}

class Magazine extends Item{
  final String name;
  final int number;
  final DateTime publicationDate;

  Magazine({required this.name, required this.number, required this.publicationDate});

  String dateFormat(DateTime date){
    final format = DateFormat("MMMM yyyy", "es_AR");
    return format.format(date);
  }

  @override
  String description() {
    return '"$name", numero $number, ${dateFormat(publicationDate)}';
  }
}
