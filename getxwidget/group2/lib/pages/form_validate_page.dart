import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group2_features/controllers/form_validate_controller.dart';

class FormValidatePage extends GetView<FormValidateController> {
  const FormValidatePage({Key? key}) : super(key: key);

  _logo() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          width: Get.width * 0.3,
          child: Image.asset(
            'assets/login.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Welcome to Validate input Values',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _input() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email'),
            validator: (val){
              return controller.validateEmail(val!);
            },
            onSaved: (val){
              controller.email=val!;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: controller.passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password'
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (val){
              return controller.validatePassword(val!);
            },
            onSaved: (val){
              controller.password=val!;
            },
          )
        ],
      ),
    );
  }

  _submit(){
    return GestureDetector(
      onTap: (){
        controller.checkLogin();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Text('Login', style: TextStyle(fontSize: 14, color: Colors.white),)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: ()=>controller.unFocus(),
          child: SafeArea(
      child: SingleChildScrollView(
          child: Form(
            key: controller.loginKey,
            autovalidateMode: controller.autoValidateMode, //AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _logo(),
                _input(),
                _submit(),
              ],
            ),
          ),
      ),
    ),
        ));
  }
}
