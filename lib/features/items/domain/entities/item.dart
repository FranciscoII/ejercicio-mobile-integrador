import 'package:equatable/equatable.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:intl/intl.dart';

import 'item_state.dart';

class Item {
  Item({DateTime? returnDate}) {
    state = returnDate != null
        ? ReservedState(expectedReturnDate: returnDate)
        : AvailableState();
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

  DateTime? returnDate() => state.returnDate();

  Duration numberOfDaysToReturn() {
    throw 'Must be implemented in subclasses';
  }
}

class Book extends Item with EquatableMixin {
  final String title;
  final String author;
  final int numberOfPages;

  Book({
    super.returnDate,
    required this.title,
    required this.author,
    required this.numberOfPages,
  });

  @override
  String description() {
    return '"$title", $author';
  }

  @override
  Duration numberOfDaysToReturn() {
    final daysToAdd = (numberOfPages / 100).ceil();
    return Duration(days: daysToAdd);
  }

  @override
  List<Object?> get props => [title, author, numberOfPages];
}

class Movie extends Item with EquatableMixin {
  final String title;

  //minutes
  final int duration;

  Movie({
    super.returnDate,
    required this.title,
    required this.duration,
  });

  @override
  String description() {
    return '"$title", $duration';
  }

  @override
  Duration numberOfDaysToReturn() {
    final daysToAdd = duration > 119 ? 5 : 3;
    return Duration(days: daysToAdd);
  }

  @override
  List<Object?> get props => [title, duration];
}

class Magazine extends Item with EquatableMixin {
  final String name;
  final int number;
  final DateTime publicationDate;

  Magazine(
      {super.returnDate,
      required this.name,
      required this.number,
      required this.publicationDate});

  String dateFormat(DateTime date) {
    final format = DateFormat("MMMM yyyy", "es_AR");
    return format.format(date);
  }

  @override
  String description() {
    return '"$name", numero $number, ${dateFormat(publicationDate)}';
  }

  @override
  Duration numberOfDaysToReturn() {
    final int daysToAdd = switch (publicationDate.year) {
      < 1980 => 2,
      >= 1980 && <= 2000 => 3,
      _ => 5
    };
    return Duration(days: daysToAdd);
  }

  @override
  List<Object?> get props => [name, number, publicationDate];
}
