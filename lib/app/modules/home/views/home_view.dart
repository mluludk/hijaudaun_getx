import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hijaudaun_getx/app/widgets/book_editor_widget.dart';
import 'package:hijaudaun_getx/app/widgets/book_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Books",
                      style: TextStyle(fontSize: 32),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/icons/union.png"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      labelText: "Search Book",
                    ),
                    textAlignVertical: TextAlignVertical.bottom),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      return BookCard(
                        data: controller.dataList[index],
                        onTap: () {
                          controller.book.value = controller.dataList[index];
                          controller.titleController.text =
                              controller.dataList[index].title;
                          controller.authorController.text =
                              controller.dataList[index].author;
                          controller.publisherController.text =
                              controller.dataList[index].publisher;
                          controller.yearController.text =
                              controller.dataList[index].year.toString();
                          controller.copiesController.text =
                              controller.dataList[index].copies.toString();
                          Get.bottomSheet(BookEditor(
                            controller: controller,
                            isNew: false,
                          ));
                        },
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                  ),
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.titleController.text = "";
          controller.authorController.text = "";
          controller.publisherController.text = "";
          controller.yearController.text = "";
          controller.copiesController.text = "";
          Get.bottomSheet(BookEditor(
            controller: controller,
            isNew: true,
          ));
          // print("dari jauh");
          // print(controller.dataList.toString());
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
