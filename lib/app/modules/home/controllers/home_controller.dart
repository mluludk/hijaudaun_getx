import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hijaudaun_getx/app/models/book_model.dart';
import 'package:hijaudaun_getx/app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController copiesController = TextEditingController();

  RxList<BookModel> dataList = <BookModel>[].obs;
  Rx<BookModel> book = BookModel(
          id: 0, title: "", publisher: "", author: "", year: 2024, copies: 0)
      .obs;
  final count = 0.obs;
  final box = GetStorage();

  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    getBooks();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getBooks() async {
    var headers = {'Content-Type': 'application/json'};
    count.value++;
    try {
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.books);
      http.Response response = await http.get(url, headers: headers);
      print("=============get book=============");
      print(url);

      if (response.statusCode == 200) {
        print("sukses ambil data");
        jsonDecode(response.body)['data'].forEach((book) {
          dataList.add(BookModel.fromJson(book));
        });
        print(dataList.toString());
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error :()'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }

  Future<void> updateBook() async {
    var headers = {
      'Content-Type': 'application/json',
      // ignore: prefer_interpolation_to_compose_strings
      'Authorization': "Bearer " + box.read('token')
    };
    //encode Map to JSON
    // var body = json.encode(data);
    book.value.title = titleController.text;
    book.value.author = authorController.text;
    book.value.publisher = publisherController.text;
    book.value.year = int.parse(yearController.text);
    book.value.copies = int.parse(copiesController.text);
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i].id != book.value.id) continue;
      dataList[i] = book.value;
      break;
    }
    var body = book.value.toJson();
    try {
      var url = Uri.parse(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.books}/${book.value.id}");
      http.Response response =
          await http.put(url, headers: headers, body: jsonEncode(body));
      print("=============update book=============");
      print(url);

      if (response.statusCode == 200) {
        print("sukses put data");
      } else {
        throw jsonDecode(response.body)["Message"] ??
            "Unknown Error Occured: ${response.statusCode}";
      }
      Get.back();
      Get.snackbar("Success", "Book is updated successfully.");
    } catch (error) {
      print(Text(error.toString()));
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error :()'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }

  Future<void> addBook() async {
    var headers = {
      'Content-Type': 'application/json',
      // ignore: prefer_interpolation_to_compose_strings
      'Authorization': "Bearer " + box.read('token')
    };
    //encode Map to JSON
    // var body = json.encode(data);
    var newBook = BookModel(
        id: 0,
        title: titleController.text,
        author: authorController.text,
        publisher: publisherController.text,
        year: 2025,
        copies: 10
        // year: int.parse(
        //   yearController.text,
        // ),
        // copies: int.parse(yearController.text)
        );

    var body = newBook.toJson();
    print(jsonEncode(body));
    try {
      var url = Uri.parse(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndpoints.books}");
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      print("=============add book=============");
      print(url);

      if (response.statusCode == 201) {
        newBook.id = jsonDecode(response.body)['data']['id'];
        dataList.add(newBook);
        print("sukses add data");
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
      Get.back();
      Get.snackbar("Success", "Book is updated successfully.");
    } catch (error) {
      print(Text(error.toString()));
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error :()'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }

  Future<void> editBook(BookModel book) async {}
}
