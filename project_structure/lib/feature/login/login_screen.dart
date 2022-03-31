
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Column( mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Container(
            width: size.width * 0.8,
            height: 50,
            child: TextField(
              onChanged: (value) {
                  _phoneNumber = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
          ),
          Container(
            width: Dimensions.textFieldWidth,
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                  _password = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            width: Dimensions.textFieldWidth,
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                //controller.login('0198558833', '12345678');
                Get.lazyPut(() => MainController());
                Get.offAll(() => const MainScreen());
              },
              child: Text('Login', style: TextStyle(fontSize: 24)),
            ),
          ),
          Container(
            child: SvgPicture.asset('assets/images/Firefox_Logo_2017.svg', 
           width: 50, height: 50),
          )
        ])
        ),
      );
  }
}
