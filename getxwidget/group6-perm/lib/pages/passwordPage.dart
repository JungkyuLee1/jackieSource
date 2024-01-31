import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/password_controller.dart';

class PasswordPage extends GetView<PasswordController> {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Strength'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Obx(
                    () => TextFormField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.isPasswordHidden.value =
                                    !controller.isPasswordHidden.value;
                              },
                              child: Icon(controller.isPasswordHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                      obscureText: controller.isPasswordHidden.value,
                      onChanged: (val) {
                        controller.checkPasswordStrength(val.toString());
                      },
                    ),
                  ),
                  Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: LinearProgressIndicator(
                        value: controller.passwordStrength.value,
                        backgroundColor: Colors.grey.withOpacity(.2),
                        color: controller.passwordStrength.value < 1 / 4
                            ? Colors.red
                            : controller.passwordStrength.value == 2 / 4
                                ? Colors.amber
                                : controller.passwordStrength.value == 3 / 4
                                    ? Colors.deepPurple
                                    : Colors.green,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.displayText.value,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
