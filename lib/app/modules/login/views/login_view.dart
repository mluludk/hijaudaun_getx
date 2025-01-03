import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: "Email",
                            ),
                            textAlignVertical: TextAlignVertical.bottom),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                            controller: controller.passwordController,
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                labelText: "Password",
                                suffix: InkWell(
                                  child: Icon(
                                    Icons.visibility,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  onTap: () {
                                    controller.isPasswordHidden.value =
                                        !controller.isPasswordHidden.value;
                                  },
                                )),
                            textAlignVertical: TextAlignVertical.bottom),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  width: 30,
                                  height: 20,
                                  child: Checkbox(
                                      value: true, onChanged: (valye) {})

                                  //   CheckboxListTile(onChanged: (bool? value) {  },
                                  //  value: true,

                                  //  )
                                  ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Remember me')
                            ]),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password'))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.loginWithEmail();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0386D0),
                              fixedSize: Size(Get.width - 40, 50),
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
                        ),
                      ],
                    ),
                  )),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: Get.width,
                  child: Image.asset(
                    "assets/images/login_bottom_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: Get.width,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
