import 'package:integrador_mobile/features/items/data/models/item_model.dart';
import 'package:test/test.dart';

main() {
  group('Book model', () {
    final expectedBookModel = BookModel(title: 'title', author: 'author', numberOfPages: 1);
    test('returns an available book when the JSON has only info about the book',
        () {
      final Map<String, dynamic> jsonBook = {
        'title': 'title',
        'author': 'author',
        'numberOfPages': 1,
      };

      expect(BookModel.fromJson(jsonBook), expectedBookModel);
    });
    test('returns a reserved book when the JSON has info about the book and the reservation',
            () {
          final returnDate = DateTime.now();
          final Map<String, dynamic> jsonBook = {
            'title': 'title',
            'author': 'author',
            'numberOfPages': 1,
            'reservedBy': {
              'name': 'Pepito'
            },
            'returnDate': returnDate.toIso8601String()
          };
          final bookModel = BookModel.fromJson(jsonBook);

          expect(bookModel, expectedBookModel);
          expect(bookModel.isReserved(), true);
          expect(bookModel.returnDate(), returnDate);
        });
  });
  group('Movie model', () {
    final expectedMovieModel = MovieModel(title: 'title', duration: 100);
    test('returns an available movie when the JSON has only info about the movie',
            () {
          final Map<String, dynamic> jsonMovie = {
            'title': 'title',
            'duration': 100,
          };

          expect(MovieModel.fromJson(jsonMovie), expectedMovieModel);
        });
    test('returns a reserved book when the JSON has info about the book and the reservation',
            () {
          final returnDate = DateTime.now();
          final Map<String, dynamic> jsonMovie = {
            'title': 'title',
            'duration': 100,
            'reservedBy': {
              'name': 'Pepito'
            },
            'returnDate': returnDate.toIso8601String()
          };
          final movieModel = MovieModel.fromJson(jsonMovie);

          expect(movieModel, expectedMovieModel);
          expect(movieModel.isReserved(), true);
          expect(movieModel.returnDate(), returnDate);
        });
  });
  group('Magazine model', () {
    final publicationDate = DateTime.now();
    final expectedMagazineModel = MagazineModel(name: 'Barbilla roja', publicationDate: publicationDate, number: 1);
    test('returns an available movie when the JSON has only info about the magazine',
            () {
          final Map<String, dynamic> jsonMagazine = {
            'name': 'Barbilla roja',
            'publicationDate': publicationDate.toIso8601String(),
            'number': 1
          };

          expect(MagazineModel.fromJson(jsonMagazine), expectedMagazineModel);
        });
    test('returns a reserved book when the JSON has info about the book and the reservation',
            () {
          final returnDate = DateTime.now();
          final Map<String, dynamic> jsonMagazine = {
            'name': 'Barbilla roja',
            'publicationDate': publicationDate.toIso8601String(),
            'number': 1,
            'reservedBy': {
              'name': 'Pepito'
            },
            'returnDate': returnDate.toIso8601String()
          };
          final magazineModel = MagazineModel.fromJson(jsonMagazine);

          expect(magazineModel, expectedMagazineModel);
          expect(magazineModel.isReserved(), true);
          expect(magazineModel.returnDate(), returnDate);
        });
  });

}
