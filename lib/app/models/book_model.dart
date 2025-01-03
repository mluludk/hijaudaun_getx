import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BookModel extends Equatable {
  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.year,
    required this.copies,
  });

  factory BookModel.fromJson(Map<String?, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      publisher: json['publisher'],
      year: int.parse(json['publication_year']),
      copies: int.parse(json['copies_available']),
    );
  }

  int id;
  String title;
  String author;
  String publisher;
  int year;
  int copies;

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "title": title,
        "author": author,
        "publisher": publisher,
        "publication_year": year.toString(),
        "copies_available": copies.toString()
      };

  @override
  List<Object?> get props =>
      <Object?>[id, title, author, publisher, year, copies];
}
