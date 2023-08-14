import 'package:integrador_mobile/features/items/domain/entities/item.dart';

class BookModel extends Book {
  BookModel(
      {super.returnDate,
      required super.title,
      required super.author,
      required super.numberOfPages});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final book = BookModel(
      title: json["title"],
      author: json['author'],
      numberOfPages: json["numberOfPages"],
      returnDate: json['returnDate'] != null ? DateTime.parse(json['returnDate']) : null,
    );
    return book;
  }
}

class MovieModel extends Movie {
  MovieModel({super.returnDate, required super.title, required super.duration});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final movie = MovieModel(
      title: json["title"],
      duration: json['duration'],
      returnDate: json['returnDate'] != null ? DateTime.parse(json['returnDate']) : null,
    );
    return movie;
  }
}

class MagazineModel extends Magazine {
  MagazineModel(
      {super.returnDate,
      required super.name,
      required super.number,
      required super.publicationDate});

  factory MagazineModel.fromJson(Map<String, dynamic> json) {
    final magazine = MagazineModel(
      name: json["name"],
      number: json['number'],
      publicationDate: DateTime.parse(json['publicationDate']),
      returnDate: json['returnDate'] != null ? DateTime.parse(json['returnDate']) : null,
    );
    return magazine;
  }
}
