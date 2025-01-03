// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hijaudaun_getx/app/models/book_model.dart';
import 'package:hijaudaun_getx/app/modules/home/controllers/home_controller.dart';

class BookEditor extends StatelessWidget {
  BookEditor({super.key, required this.controller, this.isNew});
  HomeController controller;
  bool? isNew = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        color: Colors.blue[100],
        child: Center(
          child: ListView(
            children: [
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.blue[50],
                  filled: true,
                  labelText: "Title",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.authorController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                  labelText: "Author",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.publisherController,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Publisher",
                  fillColor: Colors.blue[50],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEEF7FE),
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/finger.png"),
                        SizedBox(width: 10),
                        Text(
                          "Smart Id",
                          style: TextStyle(
                            color: Color(0xFF567DF4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isNew == true) {
                        controller.addBook();
                      } else {
                        controller.updateBook();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF567DF4),
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.asset("assets/icons/panah-kanan.png"),
                      ],
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
