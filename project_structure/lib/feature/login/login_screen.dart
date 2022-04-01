
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_structure/core/widgets/rounded_input_field.dart';
import 'package:project_structure/feature/login/login_controller.dart';
import 'package:project_structure/feature/main/main_controller.dart';
import 'package:project_structure/feature/main/main_screen.dart';
import 'package:project_structure/helper/image_helper.dart';
import 'package:project_structure/utils/dimensions.dart';

class LoginScreen extends GetView<LoginController> {
  var _phoneNumber = '';
  var _password = '';
  String dogFoodUrl = 'https://www.svgrepo.com/show/3682/dog-food.svg';
  // late LoginController loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            key: _formKey, 
            padding: const EdgeInsets.only(top: 50),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundedInputField(
                    hintText: 'Phone', 
                    icon: Icons.phone, 
                    onTextChanged: (text) {
                      _phoneNumber = text;
                    }
                  ),
                  RoundedInputField(
                    hintText: 'Password', 
                    icon: Icons.password, 
                    onTextChanged: (text) {
                      _password = text;
                    }
                  ),
                  ElevatedButton(onPressed: () {
                    Get.lazyPut(() => MainController());
                    Get.offAll(() => const MainScreen());
                  }, child: const Text('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
