import 'package:equatable/equatable.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:intl/intl.dart';

import 'item_state.dart';

abstract class Item {
  Item({DateTime? returnDate, Person? reservedBy}) {
    state = returnDate != null && reservedBy != null
        ? ReservedState(expectedReturnDate: returnDate, person: reservedBy)
        : AvailableState();
    numberOfReservations = 0;
  }

  late ItemState state;
  late int numberOfReservations;

  Person? get reservedBy => state.reservedBy();

  isReserved() => state.isReserved();

  void reserve(Person person) {
    state.reserve(this, person);
    numberOfReservations += 1;
  }

  Item copy();

  void returnToStore() {
    state.returnToStore(this);
  }

  void changeState(ItemState state) {
    this.state = state;
  }

  String description();

  DateTime? returnDate() => state.returnDate();

  Duration numberOfDaysToReturn();

  int credits();
}

enum Genre {
  drama(credits: 10),
  terror(credits: 20),
  other(credits: 30);

  const Genre({
    required this.credits,
  });

  final int credits;
}

class Book extends Item with EquatableMixin {
  final String title;
  final String author;
  final Genre genre;
  final int numberOfPages;

  Book({
    super.returnDate,
    super.reservedBy,
    required this.title,
    required this.author,
    required this.numberOfPages,
    this.genre = Genre.drama,
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
  List<Object?> get props => [title, author, numberOfPages, reservedBy];

  String header() => '$title, $author';

  @override
  int credits() => genre.credits;

  @override
  Book copy() {
    return Book(
      title: title,
      author: author,
      genre: genre,
      numberOfPages: numberOfPages,
      reservedBy: reservedBy,
      returnDate: returnDate(),
    );
  }
}

class Movie extends Item with EquatableMixin {
  final String title;
  final List<String> actors;

  //minutes
  final int duration;

  Movie({
    super.returnDate,
    super.reservedBy,
    required this.title,
    required this.duration,
    this.actors = const ['Actor 1', 'Actor 2'],
  });

  @override
  String description() {
    return '"$title", $duration minutos';
  }

  @override
  Duration numberOfDaysToReturn() {
    final daysToAdd = duration > 119 ? 5 : 3;
    return Duration(days: daysToAdd);
  }

  @override
  int credits() {
    return actors.length * 10;
  }

  @override
  List<Object?> get props => [title, duration, reservedBy];

  @override
  Item copy() {
    // TODO: implement copy
    throw UnimplementedError();
  }
}

class Magazine extends Item with EquatableMixin {
  final String name;
  final int number;
  final DateTime publicationDate;

  Magazine(
      {super.returnDate,
      super.reservedBy,
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
  int credits() {
   return 200;
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
  List<Object?> get props => [name, number, publicationDate, reservedBy];

  @override
  Item copy() {
    // TODO: implement copy
    throw UnimplementedError();
  }
}
