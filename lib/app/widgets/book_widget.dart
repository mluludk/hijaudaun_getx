import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:get/get.dart';
import 'package:hijaudaun_getx/app/models/book_model.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    this.onTap,
    required this.data,
    // required this.title,
    // required this.author,
    // required this.publisher,
    // this.year,
    // this.copies,
  });
  final VoidCallback? onTap;
  final BookModel data;
  // final String author;
  // final String title;
  // final String publisher;
  // final int? year;
  // final int? copies;

  @override
  Widget build(BuildContext context) {
    Color widgetColor = RandomColor.getColorObject(Options(
//      count: 27,
        format: Format.rgbArray,
//      colorType: ColorType.blue,
        luminosity: Luminosity.light,
        alpha: 0.1));
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.book_outlined,
                    color: Colors.black38,
                  ),
                  Flexible(
                    child: Text(
                      data.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person_2_outlined, color: Colors.black38),
                  Flexible(
                    child: Text(
                      data.author,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.food_bank_outlined, color: Colors.black38),
                  Flexible(
                    child: Text(
                      data.publisher,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black38,
                  ),
                  Flexible(
                    child: Text(
                      data.year.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.print_outlined,
                    color: Colors.black45,
                  ),
                  Flexible(
                    child: Text(
                      data.copies.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
