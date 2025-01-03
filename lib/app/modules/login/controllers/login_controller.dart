import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hijaudaun_getx/app/routes/app_pages.dart';
import 'package:hijaudaun_getx/app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //TODO: Implement LoginController
  var isPasswordHidden = true.obs;
  var emailInput = "admin@gmail.com".obs;
  var passwordInput = "abc123".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    final box = GetStorage();

    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text,
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(box.read("token"));
      print("==========================");
      print(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json['access_token']);
        if (json['access_token'] != "") {
          var token = json['access_token'];
          box.write('token', token);
          // final SharedPreferences? prefs = await _prefs;
          // await prefs?.setString('token', token);

          emailController.clear();
          passwordController.clear();
          // Get.off(HomeScreen());
        } else if (json['access_token'] == null) {
          throw jsonDecode(response.body)['message'];
        }
        Get.toNamed(Routes.HOME);
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
}
