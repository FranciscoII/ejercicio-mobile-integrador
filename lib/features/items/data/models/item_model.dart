import 'package:integrador_mobile/features/items/domain/entities/item.dart';

import '../../domain/entities/person.dart';

class BookModel extends Book {
  BookModel(
      {super.returnDate,
        super.reservedBy,
      required super.title,
      required super.author,
      required super.numberOfPages});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final book = BookModel(
      title: json["title"],
      author: json['author'],
      numberOfPages: json["numberOfPages"],
      returnDate: json['returnDate'] != null ? DateTime.parse(json['returnDate']) : null,
      reservedBy: json['reservedBy'] != null ? Person(json['reservedBy']['name']) : null,
    );
    return book;
  }
}

class MovieModel extends Movie {
  MovieModel({super.returnDate, super.reservedBy, required super.title, required super.duration});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final movie = MovieModel(
      title: json["title"],
      duration: json['duration'],
      returnDate: json['returnDate'] != null ? DateTime.parse(json['returnDate']) : null,
      reservedBy: json['reservedBy'] != null ? Person(json['reservedBy']['name']) : null,
    );
    return movie;
  }
}

class MagazineModel extends Magazine {
  MagazineModel(
      {super.returnDate,
        super.reservedBy,
      required super.name,
      required super.number,
      required super.publicationDate});

  factory MagazineModel.fromJson(Map<String, dynamic> json) {
    final magazine = MagazineModel(
      name: json["name"],
      number: json['number'],
      publicationDate: DateTime.parse(json['publicationDate']),
      returnDate: json['returnDate'] != null ? DateTime.parse(json['returnDate']) : null,
      reservedBy: json['reservedBy'] != null ? Person(json['reservedBy']['name']) : null,
    );
    return magazine;
  }
}
